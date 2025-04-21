import 'package:EzNutri/presentation/pages/authentication/account/acount_page.dart';
import 'package:flutter/material.dart';
import 'package:EzNutri/core/navbar/nav_bar.dart';
import 'package:EzNutri/main.dart';
import 'package:EzNutri/presentation/pages/authentication/login_signup/login_page.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    final session = supabase.auth.currentSession;

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
    } else {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/vectors/logo.svg',
          height: 100,
        )
            .animate()
            .scaleXY(duration: 500.ms, begin: 0.3)
            .scaleXY(delay: 600.ms, begin: 1, end: 0.2),
      ),
    );
  }
}
