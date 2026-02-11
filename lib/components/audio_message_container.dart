import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:openapi/openapi.dart';

class AudioMessageContainer extends StatefulWidget {
  const AudioMessageContainer({super.key, required this.message});

  final MessageResponseDTO message;

  @override
  State<AudioMessageContainer> createState() => _AudioMessageContainerState();
}

class _AudioMessageContainerState extends State<AudioMessageContainer> {
  late AudioPlayer _player;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      if (mounted) {
        setState(() {
          _hasError = false;
        });
      }
      await _player.setUrl(widget.message.content);
    } catch (e) {
      debugPrint('Error loading audio source: $e');
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  @override
  void didUpdateWidget(covariant AudioMessageContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message.content != widget.message.content) {
      _initAudio();
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isAuthor = widget.message.author.id == AppService.instance.userId;
    final theme = Theme.of(context);
    
    if (_hasError) {
      return Container(
        padding: const EdgeInsets.all(8),
        child: const Text('Error loading audio', style: TextStyle(color: Colors.red)),
      );
    }
    
    return Container(
      padding: const EdgeInsets.all(8),
      width: 250, // Fixed width for audio player
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isAuthor)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                widget.message.author.username,
                style: TextStyle(color: theme.hintColor, fontSize: 10),
              ),
            ),
          Row(
            children: [
              StreamBuilder<PlayerState>(
                stream: _player.playerStateStream,
                builder: (context, snapshot) {
                  final playerState = snapshot.data;
                  final processingState = playerState?.processingState;
                  final playing = playerState?.playing;
                  if (processingState == ProcessingState.loading ||
                      processingState == ProcessingState.buffering) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      width: 24.0,
                      height: 24.0,
                      child: const CircularProgressIndicator(),
                    );
                  } else if (processingState == ProcessingState.completed) {
                    return IconButton(
                      icon: const Icon(Icons.replay),
                      iconSize: 32.0,
                      onPressed: () async {
                        try {
                          await _player.pause();
                          await _player.seek(Duration.zero);
                          await _player.play();
                        } catch (e) {
                          debugPrint('Error replaying audio: $e');
                        }
                      },
                    );
                  } else if (playing != true) {
                    return IconButton(
                      icon: const Icon(Icons.play_arrow),
                      iconSize: 32.0,
                      onPressed: _player.play,
                    );
                  } else {
                    return IconButton(
                      icon: const Icon(Icons.pause),
                      iconSize: 32.0,
                      onPressed: _player.pause,
                    );
                  }
                },
              ),
              Expanded(
                child: StreamBuilder<Duration?>(
                  stream: _player.durationStream,
                  builder: (context, snapshot) {
                    final duration = snapshot.data ?? Duration.zero;
                    return StreamBuilder<Duration>(
                      stream: _player.positionStream,
                      builder: (context, snapshot) {
                        var position = snapshot.data ?? Duration.zero;
                        if (position > duration) {
                          position = duration;
                        }
                        return ProgressBar(
                          progress: position,
                          total: duration,
                          onSeek: _player.seek,
                          baseBarColor: theme.colorScheme.surfaceContainerHighest,
                          progressBarColor: theme.colorScheme.primary,
                          thumbColor: theme.colorScheme.primary,
                          timeLabelLocation: TimeLabelLocation.below,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              formatPostedDate(widget.message.createdAt, context),
              style: TextStyle(color: theme.hintColor, fontSize: 9),
            ),
          ),
        ],
      ),
    );
  }
}
