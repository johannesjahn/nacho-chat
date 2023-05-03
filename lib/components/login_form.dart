import 'package:flutter/material.dart';
import 'package:nacho_chat/pages/home.dart';
import 'package:nacho_chat/service/auth.dart';
import 'package:nacho_chat/service/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  login() async {
    if (_formKey.currentState?.validate() ?? false) {
      final success = await AuthService.instance.login(
          username: usernameController.text, password: passwordController.text);

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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text("Nacho Chat", style: theme.textTheme.headline1),
        ),
        Form(
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
                    decoration: InputDecoration(
                      labelText: l10n.username,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return l10n.please_enter_your_username;
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: l10n.password,
                    ),
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
                                password: passwordController.text);

                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                                context, DefaultRoute(const HomePage()));
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
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
