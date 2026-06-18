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
      duration: const Duration(seconds: 14),
    )..repeat();

    final rng = Random(42);
    _bubbles = List.generate(
      14,
      (i) => _Bubble(
        x: rng.nextDouble(),
        y: rng.nextDouble(),
        radius: 12.0 + rng.nextDouble() * 70.0,
        phase: rng.nextDouble() * 2 * pi,
        // Integer frequencies guarantee the motion completes a whole number
        // of cycles per loop, so it returns exactly to its start with no jump.
        xFreq: 1 + rng.nextInt(2),
        yFreq: 1 + rng.nextInt(2),
        driftX: 0.04 + rng.nextDouble() * 0.05,
        driftY: 0.05 + rng.nextDouble() * 0.06,
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
          final angle = t * 2 * pi;
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // A full 2*pi rotation lands back on the starting orientation,
                // so the gradient sweep loops without a seam.
                begin: Alignment(cos(angle) * 0.8, sin(angle) * 0.8),
                end: Alignment(-cos(angle) * 0.8, -sin(angle) * 0.8),
                colors: [
                  colorScheme.primaryContainer,
                  colorScheme.tertiaryContainer,
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
  final int xFreq;
  final int yFreq;
  final double driftX;
  final double driftY;

  const _Bubble({
    required this.x,
    required this.y,
    required this.radius,
    required this.phase,
    required this.xFreq,
    required this.yFreq,
    required this.driftX,
    required this.driftY,
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
    final angle = progress * 2 * pi;
    final paint = Paint()
      ..style = PaintingStyle.fill
      // Soft blur turns the circles into gentle, glowing orbs.
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);
    for (final bubble in bubbles) {
      // Every term is an integer multiple of `angle`, so at progress 0 and 1
      // the position, size and opacity match exactly: a perfectly seamless loop.
      final px = sin(angle * bubble.xFreq + bubble.phase);
      final py = cos(angle * bubble.yFreq + bubble.phase);
      final x = (bubble.x + px * bubble.driftX) * size.width;
      final y = (bubble.y + py * bubble.driftY) * size.height;
      final pulse = (px + 1) / 2; // 0..1
      final radius = bubble.radius * (0.9 + pulse * 0.2);
      paint.color = color.withValues(alpha: 0.04 + pulse * 0.06);
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(_BubblePainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
