// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:nacho_chat/pages/login.dart';

Widget makeTestableWidget({required Widget child}) {
  return MediaQuery(
    data: const MediaQueryData(),
    child: MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
      ],
      home: child,
    ),
  );
}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: const LoginPage()));
    await tester.pumpAndSettle();

    // Verify that our counter starts at 0.
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    final loginButton = find
        .widgetWithText(MaterialButton, 'Login')
        .evaluate()
        .first
        .widget as MaterialButton;

    loginButton.onPressed!();
  });
}
