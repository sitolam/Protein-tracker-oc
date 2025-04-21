import 'package:EzNutri/main.dart';
import 'package:flutter/widgets.dart';

class UserData extends ChangeNotifier {
  void updateName(String newName) async {
    await supabase
        .from('profiles')
        .update({'username': newName}).eq('id', supabase.auth.currentUser!.id);
  }

  void updateWeight(num newWeight) async {
    await supabase
        .from('profiles')
        .update({'weight': newWeight}).eq('id', supabase.auth.currentUser!.id);
  }

  void updateProteinRatio(num newRatio) async {
    await supabase.from('profiles').update({'protein_ratio': newRatio}).eq(
        'id', supabase.auth.currentUser!.id);
  }

  void updateGoalIntake(int newGoalIntake) async {
    await supabase.from('profiles').update({'goal_intake': newGoalIntake}).eq(
        'id', supabase.auth.currentUser!.id);
  }

  void updateGoalReachedState(bool goalReached) async {
    await supabase.from('profiles').update({'goal_reached': goalReached}).eq(
        'id', supabase.auth.currentUser!.id);
  }

  late final userName = supabase
      .from('profiles')
      .select('username')
      .eq('id', supabase.auth.currentUser!.id);
  late final weight = supabase
      .from('profiles')
      .select('weight')
      .eq('id', supabase.auth.currentUser!.id);
  late final proteinRatio = supabase
      .from('profiles')
      .select('protein_ratio')
      .eq('id', supabase.auth.currentUser!.id);
  late final goalIntake = supabase
      .from('profiles')
      .select('goal_intake')
      .eq('id', supabase.auth.currentUser!.id);

  UserData();
}
