import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:EzNutri/core/theme/theme.dart';
import 'package:EzNutri/presentation/pages/authentication/splash/splash_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: '<supabaseUrl>',
    anonKey:
        '<anonKey>',
  );
  runApp(const ProviderScope(child: EzNutri()));
}

final supabase = Supabase.instance.client;

class EzNutri extends StatelessWidget {
  const EzNutri({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThemedMaterialApp(
      home: SplashPage(),
    );
  }
}
