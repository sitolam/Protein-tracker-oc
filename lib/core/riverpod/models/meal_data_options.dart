import 'package:EzNutri/main.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MealDataOptions extends ChangeNotifier {
  final userId = supabase.auth.currentUser!.id;

  void addNew({
    required String mealType,
    required String name,
    required num proteins,
    required num weight,
    required List items,
  }) async {
    await supabase.from('${mealType}_list').insert({
      'user_id': supabase.auth.currentUser!.id,
      'name': name,
      'proteins': proteins,
      'weight': weight,
      'items': items,
    });
  }

  void update({
    required String mealType,
    required String id,
    required String name,
    required num weight,
    required num proteins,
    required List items,
  }) async {
    await supabase.from("${mealType}_list").update({
      'name': name,
      'proteins': proteins,
      'weight': weight,
      'items': items
    }).eq('id', id);
  }

  void updateUsage({
    required String id,
    required String mealType,
    required int currentUsage,
  }) async {
    await supabase
        .from("${mealType}_list")
        .update({'usage': currentUsage + 1}).eq('id', id);
  }

  Future<PostgrestList> getItem({
    required String mealType,
    required String id,
  }) async {
    return await supabase
        .from("${mealType}_list")
        .select('*')
        .eq('user_id', userId)
        .eq('id', id);
  }

  List list(List meal) {
    List list1 = [];
    List list2 = [];

    for (int i = 0; i < meal.length; i++) {
      if (i % 2 == 0) {
        list1.add(meal[i]);
      } else {
        list2.add(meal[i]);
      }
    }
    List combinedList = [list1, list2];
    return combinedList;
  }

  late final breakfastData =
      supabase.from('breakfast_list').select('*').eq('user_id', userId);
  late final lunchData =
      supabase.from('lunch_list').select('*').eq('user_id', userId);
  late final dinnerData =
      supabase.from('dinner_list').select('*').eq('user_id', userId);
  late final snacksData =
      supabase.from('snacks_list').select('*').eq('user_id', userId);
  MealDataOptions();
}
