import 'package:flutter/material.dart';
import 'package:nacho_chat/service/auth.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Form(
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
            border: Border.all(
              color: theme.hintColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    child: Text(
                      "Register",
                      style: theme.textTheme.labelLarge,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        await AuthService.instance.register(
                            username: usernameController.text,
                            password: passwordController.text);

                        Navigator.of(context).pushReplacementNamed('/');
                      }
                    },
                  ),
                  MaterialButton(
                    child: Text(
                      "Login",
                      style: theme.textTheme.labelLarge,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        await AuthService.instance.login(
                            username: usernameController.text,
                            password: passwordController.text);

                        Navigator.of(context).pushReplacementNamed('/');
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
