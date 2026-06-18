import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nacho_chat/components/login_form.dart';
import 'package:nacho_chat/components/version_display.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_Bubble> _bubbles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    final rng = Random(42);
    _bubbles = List.generate(
      10,
      (i) => _Bubble(
        x: rng.nextDouble(),
        y: rng.nextDouble(),
        radius: 15.0 + rng.nextDouble() * 80.0,
        phase: rng.nextDouble() * 2 * pi,
        speedFactor: 0.2 + rng.nextDouble() * 0.4,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final t = _controller.value;
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(
                  cos(t * 2 * pi) * 0.8,
                  sin(t * 2 * pi) * 0.8,
                ),
                end: Alignment(
                  -cos(t * 2 * pi) * 0.8,
                  -sin(t * 2 * pi) * 0.8,
                ),
                colors: [
                  colorScheme.primaryContainer,
                  colorScheme.secondaryContainer,
                ],
              ),
            ),
            child: CustomPaint(
              painter: _BubblePainter(
                bubbles: _bubbles,
                progress: t,
                color: colorScheme.primary,
              ),
              child: child,
            ),
          );
        },
        child: const Stack(
          children: [
            Center(child: LoginForm()),
            Positioned(bottom: 5, left: 5, child: VersionDisplay()),
          ],
        ),
      ),
    );
  }
}

class _Bubble {
  final double x;
  final double y;
  final double radius;
  final double phase;
  final double speedFactor;

  const _Bubble({
    required this.x,
    required this.y,
    required this.radius,
    required this.phase,
    required this.speedFactor,
  });
}

class _BubblePainter extends CustomPainter {
  final List<_Bubble> bubbles;
  final double progress;
  final Color color;

  _BubblePainter({
    required this.bubbles,
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    for (final bubble in bubbles) {
      final t = progress * 2 * pi * bubble.speedFactor + bubble.phase;
      final x = (bubble.x + sin(t) * 0.08) * size.width;
      final y = (bubble.y + cos(t * 0.7) * 0.08) * size.height;
      paint.color = color.withValues(alpha: 0.06 + sin(t).abs() * 0.04);
      canvas.drawCircle(Offset(x, y), bubble.radius, paint);
    }
  }

  @override
  bool shouldRepaint(_BubblePainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
