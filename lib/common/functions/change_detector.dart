import 'package:EzNutri/common/functions/confetti.dart';
import 'package:EzNutri/core/riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChangeDetector {
  String name;
  ChangeNotifierProvider provider;
  WidgetRef ref;
  BuildContext context;
  bool confettiLaunched = false;

  final supabase = Supabase.instance.client;
  ChangeDetector(
      {required this.name,
      required this.provider,
      required this.ref,
      required this.context}) {
    supabase
        .channel(name)
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: 'user_id',
              value: supabase.auth.currentUser!.id,
            ),
            callback: (payload) {
              ref.invalidate(provider);
              _checkGoalReached();
            })
        .subscribe();
  }

  Future<void> _checkGoalReached() async {
    final goalReached = await supabase
        .from('profiles')
        .select('goal_reached')
        .eq('id', supabase.auth.currentUser!.id)
        .single();
    final goalIntake = await supabase
        .from('profiles')
        .select('goal_intake')
        .eq('id', supabase.auth.currentUser!.id)
        .single();
    ref.watch(mealData).sumProteins().then((value) {
      if (!confettiLaunched &&
          !goalReached['goal_reached'] &&
          value >= goalIntake['goal_intake']) {
        confettiLaunched = true;
        // ignore: use_build_context_synchronously
        confetti(context);
        ref.read(userData).updateGoalReachedState(true);
      } else if (goalReached['goal_reached'] &&
          value < goalIntake['goal_intake']) {
        ref.read(userData).updateGoalReachedState(false);
        confettiLaunched = false;
      }
    });
  }
}
