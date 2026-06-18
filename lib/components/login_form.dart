import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nacho_chat/pages/home.dart';
import 'package:nacho_chat/service/auth.dart';
import 'package:nacho_chat/service/utils.dart';
import 'package:nacho_chat/l10n/app_localizations.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  late AnimationController _entranceController;
  late AnimationController _shimmerController;
  late AnimationController _glowController;

  late Animation<double> _fade;
  late Animation<Offset> _slide;
  late Animation<double> _shimmer;
  late Animation<double> _glow;

  @override
  void initState() {
    super.initState();

    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..repeat();

    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);

    _fade = CurvedAnimation(parent: _entranceController, curve: Curves.easeOut);

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _entranceController, curve: Curves.easeOutCubic),
    );

    // Linear so the gradient rotates at a constant speed; a full 2*pi turn
    // returns to the identical gradient, giving a seamless continuous spin.
    _shimmer = _shimmerController;

    _glow = CurvedAnimation(parent: _glowController, curve: Curves.easeInOut);

    _entranceController.forward();
  }

  @override
  void dispose() {
    _entranceController.dispose();
    _shimmerController.dispose();
    _glowController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  login() async {
    if (_formKey.currentState?.validate() ?? false) {
      final success = await AuthService.instance.login(
        username: usernameController.text,
        password: passwordController.text,
      );

      if (success) {
        // ignore: use_build_context_synchronously
        while (Navigator.canPop(context)) {
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        }
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, DefaultRoute(const HomePage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final l10n = AppLocalizations.of(context)!;

    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated rotating gradient title
            AnimatedBuilder(
              animation: _shimmer,
              builder: (context, child) {
                return ShaderMask(
                  shaderCallback:
                      (bounds) => LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.secondary,
                          theme.colorScheme.tertiary,
                          theme.colorScheme.primary,
                        ],
                        transform: GradientRotation(_shimmer.value * 2 * pi),
                      ).createShader(bounds),
                  blendMode: BlendMode.srcIn,
                  child: child,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  'Nacho Chat',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            // Glowing animated wrapper for the form
            AnimatedBuilder(
              animation: _glow,
              builder: (context, child) {
                return Container(
                  width: width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.primary.withValues(
                          alpha: 0.08 + _glow.value * 0.14,
                        ),
                        blurRadius: 12 + _glow.value * 18,
                        spreadRadius: 1 + _glow.value * 3,
                      ),
                    ],
                  ),
                  child: child,
                );
              },
              child: Form(
                key: _formKey,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 224,
                    minHeight: 224,
                    minWidth: 200,
                  ),
                  child: Container(
                    width: width * 0.5,
                    decoration: BoxDecoration(
                      border: Border.all(color: theme.hintColor, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(labelText: l10n.username),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l10n.please_enter_your_username;
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: l10n.password),
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          obscureText: true,
                          onFieldSubmitted: (value) {
                            login();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l10n.please_enter_your_password;
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              child: Text(
                                l10n.register,
                                style: theme.textTheme.labelLarge,
                              ),
                              onPressed: () async {
                                if (_formKey.currentState?.validate() ?? false) {
                                  await AuthService.instance.register(
                                    username: usernameController.text,
                                    password: passwordController.text,
                                  );

                                  if (context.mounted) {
                                    Navigator.pushReplacement(
                                      context,
                                      DefaultRoute(const HomePage()),
                                    );
                                  }
                                }
                              },
                            ),
                            MaterialButton(
                              child: Text(
                                l10n.login,
                                style: theme.textTheme.labelLarge,
                              ),
                              onPressed: () {
                                login();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
