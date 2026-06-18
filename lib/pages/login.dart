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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();
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
          final angle = _controller.value * 2 * pi;
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
            child: child,
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
