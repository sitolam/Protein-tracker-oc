import 'package:EzNutri/common/functions/execute_with_error_handling.dart';
import 'package:EzNutri/main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> nativeGoogleSignIn(context) async {
  /// Web Client ID that you registered with Google Cloud.
  const webClientId =
      '937032879002-ve3oj4ialrepd6s2btggu4o490ii9h1b.apps.googleusercontent.com';

  const iosClientId =
      '937032879002-jbcpvqmm0l61hhpanpui10vf9lsq4nlv.apps.googleusercontent.com';

  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: iosClientId,
    serverClientId: webClientId,
  );
  final googleUser = await googleSignIn.signIn();
  final googleAuth = await googleUser!.authentication;
  final accessToken = googleAuth.accessToken;
  final idToken = googleAuth.idToken;

  if (accessToken == null) {
    throw 'No Access Token found.';
  }
  if (idToken == null) {
    throw 'No ID Token found.';
  }
  executeWithErrorHandling(
      type: FunctionType.async,
      context: context,
      action: () async {
        await supabase.auth.signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: idToken,
          accessToken: accessToken,
        );
      });
}

void googleSignIn(context) {
  executeWithErrorHandling(
      type: FunctionType.sync,
      context: context,
      action: () {
        supabase.auth.signInWithOAuth(
          OAuthProvider.google,
          redirectTo:
              'https://wnyxlcdvwddxrfcrgrzp.supabase.co/auth/v1/callback',
        );
      });
}
