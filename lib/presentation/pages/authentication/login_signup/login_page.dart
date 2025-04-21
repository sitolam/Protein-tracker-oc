import 'dart:async';
import 'dart:io';

import 'package:EzNutri/presentation/pages/authentication/account/acount_page.dart';
import 'package:EzNutri/presentation/pages/authentication/login_signup/functions/login/google_singin.dart';
import 'package:EzNutri/presentation/pages/authentication/login_signup/functions/login/password_email.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:EzNutri/common/widgets/input_fields/password_field.dart';
import 'package:EzNutri/core/navbar/nav_bar.dart';
import 'package:EzNutri/main.dart';
import 'package:EzNutri/presentation/pages/authentication/login_signup/password_reset/password_reset.dart';
import 'package:EzNutri/presentation/pages/authentication/login_signup/signup_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:EzNutri/common/widgets/buttons/text_button.dart';
import 'package:EzNutri/common/widgets/input_fields/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailField = InputField(
    hint: 'Email',
    keyboardType: TextInputType.emailAddress,
  );
  // ignore: unused_field
  late final StreamSubscription<AuthState> _authSubscription;

  final passwordField = PasswordInputField(hint: 'Password');

  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    _authSubscription = supabase.auth.onAuthStateChange.listen((event) async {
      final session = event.session;

      if (session != null) {
        final response = await supabase
            .from('profiles')
            .select('*')
            .eq('id', supabase.auth.currentUser!.id)
            .single();

        if (response['username'] == 'none' ||
            response['weight'] == 0 ||
            response['goal_intake'] == 1) {
          if (!mounted) return;
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => AccountPage()));
        } else {
          if (!mounted) return;
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: emailField,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: passwordField,
            ),
            const SizedBox(height: 12),
            ButtonText(
              text: "Sign In",
              onPressed: () {
                passwordEmailLogin(
                    context: context,
                    emailField: emailField,
                    passwordField: passwordField);
              },
            ),
            ButtonText(
              text: "Sign Up",
              style: Style.secondary,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUp()));
              },
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
                      return nativeGoogleSignIn(context);
                    }
                    googleSignIn(context);
                    setState(() {});
                    _redirect();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer),
                    ),
                    height: 40,
                    width: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/icon/google.png'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResetPassword()));
              },
              child: RichText(
                  text: const TextSpan(text: "Forgot Password? ", children: [
                TextSpan(
                    text: "Reset Password",
                    style: TextStyle(
                      color: Colors.blue,
                    ))
              ])),
            )
          ],
        ),
      ),
    );
  }
}
