import 'package:flutter/material.dart';
import 'package:nacho_chat/components/login_form.dart';
import 'package:nacho_chat/components/version_display.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomSheet: VersionDisplay(),
      body: Center(
        child: LoginForm(),
      ),
    );
  }
}
