import 'package:baby_list/feature/signup/presentation/organism/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/presentation/pump_test_widget.dart';
import '../../../../core/presentation/enter_keyboard_text.dart';
import '../../../../core/presentation/test_widget.dart';

class OnSubmitMock extends Mock {
  void call(String username, String email, String password);
}

void main() {
  testWidgets('when successful submit should return name, email and password',
      (WidgetTester tester) async {
    const String testUsername = 'Test User';
    const String testEmail = 'test@test.test';
    const String testPassword = 'mySecurePass123';
    final OnSignUpSubmit onSubmit = OnSubmitMock();
    await tester.pumpTestWidget(SignUpForm(onSubmit: onSubmit));
    final Finder username = find.byKey(Key('username'));
    await tester.enterKeyboardText(username, testUsername);
    final Finder email = find.byKey(Key('email'));
    await tester.enterKeyboardText(email, testEmail);
    final Finder password = find.byKey(Key('password'));
    await tester.enterKeyboardText(password, testPassword);
    final Finder confirmPassword = find.byKey(Key('confirmPassword'));
    await tester.enterKeyboardText(confirmPassword, testPassword);
    final Finder submit = find.text('Send');

    await tester.tap(submit);

    verify(onSubmit(testUsername, testEmail, testPassword));
  });

  testWidgets(
      'should contain title, username, email, password, confirm password and submit button',
      (WidgetTester tester) async {
    await tester.pumpTestWidget(SignUpForm(onSubmit: (_, __, ___) {}));

    final Finder title = find.text('Sign Up');
    final Finder username = find.text('Name');
    final Finder email = find.text('Email');
    final Finder password = find.text('Password');
    final Finder confirmPassword = find.text('Repeat password');
    final Finder submit = find.text('Send');

    expect(title, findsOneWidget);
    expect(username, findsOneWidget);
    expect(email, findsOneWidget);
    expect(password, findsOneWidget);
    expect(confirmPassword, findsOneWidget);
    expect(submit, findsOneWidget);
  });
/*
  testWidgets('when username is null should display error message',
      (WidgetTester tester) async {
    await tester.pumpTestWidget(SignUpForm(onSubmit: (_, __, ___) {}));
    final Finder submit = find.byKey(Key('send'));

    await tester.tap(submit);
    await tester.pumpAndSettle();

    final Finder errorMessage = find.text('Enter your name');
    expect(errorMessage, findsOneWidget);
  });

  testWidgets('when username is empty should display error message',
      (WidgetTester tester) async {
    await tester.pumpTestWidget(SignUpForm(onSubmit: (_, __, ___) {}));
    final Finder username = find.byKey(Key('username'));
    await tester.enterKeyboardText(username, '');
    final Finder submit = find.text('Send');

    await tester.tap(submit);
    await tester.pumpAndSettle();

    final Finder errorMessage = find.text('Enter your name');
    expect(errorMessage, findsOneWidget);
  });

  testWidgets('when email is null should display error message',
      (WidgetTester tester) async {
    await tester.pumpTestWidget(SignUpForm(onSubmit: (_, __, ___) {}));
    final Finder submit = find.text('Send');

    await tester.tap(submit);
    await tester.pumpAndSettle();

    final Finder errorMessage = find.text('Enter your email');
    expect(errorMessage, findsOneWidget);
  });

  testWidgets('when email is empty should display error message',
      (WidgetTester tester) async {
    await tester
        .pumpTestWidget(Test(child: SignUpForm(onSubmit: (_, __, ___) {})));
    final Finder email = find.byKey(Key('email'));
    await tester.enterKeyboardText(email, '');
    final Finder submit = find.text('Send');

    await tester.tap(submit);
    await tester.pumpAndSettle();

    final Finder errorMessage = find.text('Enter your email');
    expect(errorMessage, findsOneWidget);
  });

  testWidgets('when invalid email should display error message',
      (WidgetTester tester) async {
    await tester.pumpTestWidget(SignUpForm(onSubmit: (_, __, ___) {}));
    final Finder email = find.byKey(Key('email'));
    await tester.enterText(email, "thisIsNotAMail");
    final Finder submit = find.text('Send');

    await tester.tap(submit);
    await tester.pumpAndSettle();

    final Finder errorMessage = find.text('Invalid email');
    expect(errorMessage, findsOneWidget);
  });

  testWidgets(
      'when password error message is present should display error message',
      (WidgetTester tester) async {
    String message = 'Error message';

    await tester.pumpTestWidget(SignUpForm(
      onSubmit: (_, __, ___) {},
      passwordErrorMessage: message,
    ));

    final Finder errorMessage = find.text(message);
    expect(errorMessage, findsOneWidget);
  });

  testWidgets('when password is null should display error message',
      (WidgetTester tester) async {
    await tester.pumpTestWidget(SignUpForm(onSubmit: (_, __, ___) {}));
    final Finder submit = find.text('Send');

    await tester.tap(submit);
    await tester.pumpAndSettle();

    final Finder errorMessage = find.text('Enter a password');
    expect(errorMessage, findsOneWidget);
  });

  testWidgets('when password is empty should display error message',
      (WidgetTester tester) async {
    await tester.pumpTestWidget(SignUpForm(onSubmit: (_, __, ___) {}));
    final Finder email = find.byKey(Key('password'));
    await tester.enterKeyboardText(email, '');
    final Finder submit = find.text('Send');

    await tester.tap(submit);
    await tester.pumpAndSettle();

    final Finder errorMessage = find.text('Enter a password');
    expect(errorMessage, findsOneWidget);
  });

  testWidgets(
      'when password and confirmation do not match should display error message',
      (WidgetTester tester) async {
    await tester.pumpTestWidget(SignUpForm(onSubmit: (_, __, ___) {}));
    final Finder email = find.byKey(Key('password'));
    await tester.enterKeyboardText(email, 'password');
    final Finder confirmPassword = find.byKey(Key('confirmPassword'));
    await tester.enterKeyboardText(confirmPassword, 'wrong password');
    final Finder submit = find.text('Send');

    await tester.tap(submit);
    await tester.pumpAndSettle();

    final Finder errorMessage = find.text('Passwords do not match');
    expect(errorMessage, findsOneWidget);
  });

  testWidgets('when is sending input should not possible',
      (WidgetTester tester) async {
    await tester.pumpTestWidget(
      SignUpForm(
        onSubmit: (_, __, ___) {},
        isSending: true,
      ),
      shouldPumpAndSettle: false,
    );
    await tester.pump(Duration(seconds: 1));

    final Finder username = find.byKey(Key('username'));
    await tester.showKeyboard(username);
    expect(tester.testTextInput.hasAnyClients, false);

    final Finder email = find.byKey(Key('email'));
    await tester.showKeyboard(email);
    expect(tester.testTextInput.hasAnyClients, false);

    final Finder password = find.byKey(Key('password'));
    await tester.showKeyboard(password);
    expect(tester.testTextInput.hasAnyClients, false);

    final Finder confirmPassword = find.byKey(Key('confirmPassword'));
    await tester.showKeyboard(confirmPassword);
    expect(tester.testTextInput.hasAnyClients, false);

    final Finder submit = find.byType(ElevatedButton);
    ElevatedButton submitButton = tester.widget<ElevatedButton>(submit);
    expect(submitButton.enabled, isFalse);
  });
  */
}
