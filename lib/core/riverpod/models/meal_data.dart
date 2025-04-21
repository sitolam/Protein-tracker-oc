import 'dart:convert';

import 'package:EzNutri/main.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MealData extends ChangeNotifier {
  final userId = supabase.auth.currentUser!.id;

  Future<double> sumProteins() async {
    final sum = await Future.wait([
      _sumFromTable('breakfast', userId),
      _sumFromTable('lunch', userId),
      _sumFromTable('dinner', userId),
      _sumFromTable('snacks', userId),
    ]).then((values) => values.reduce((a, b) => a + b));

    return sum.toDouble();
  }

  Future<double> _sumFromTable(String tableName, String userId) async {
    final supabase = Supabase.instance.client;
    final query =
        supabase.from(tableName).select('proteins').eq('user_id', userId);

    try {
      final result = await query;
      List items = [for (var i in result) i['proteins'].toDouble()];
      return items.reduce((a, b) => a + b);
    } catch (error) {
      return 0;
    }
  }

  void delete(String mealType, String id) async {
    await supabase.from(mealType).delete().eq('id', id);
  }

  void cloneAdd({
    required BuildContext context,
    required String mealType,
    required String parentId,
    required String name,
    required num proteins,
    required num amount,
    required num weight,
    required List items,
  }) async {
    await supabase.from(mealType).insert({
      'user_id': supabase.auth.currentUser!.id,
      'name': name,
      'quantity': amount,
      'weight': weight,
      'proteins': amount * proteins,
      'items': items,
      'parent_id': parentId,
    });
  }

  void updateAmount({
    required String id,
    required String mealType,
    required num amount,
    required num proteins,
  }) async {
    await supabase.from(mealType).update({
      'quantity': amount,
      'proteins': amount * proteins,
    }).eq('id', id);
  }

  void update({
    required String mealType,
    required String id,
    required String name,
    required num amount,
    required num weight,
    required num proteins,
    required List items,
  }) async {
    await supabase.from(mealType).update({
      'name': name,
      'weight': weight,
      'proteins': amount * proteins,
      'items': items,
      'quantity': amount,
    }).eq('id', id);
  }

  Future<PostgrestList> getItem({
    required String mealType,
    required String name,
    required List items,
  }) async {
    return await supabase
        .from(mealType)
        .select('*')
        .eq('name', name)
        .eq('items', json.encode(items))
        .eq('user_id', supabase.auth.currentUser!.id);
  }

  Future<PostgrestList> getParentItem({
    required String mealType,
    required String parentId,
  }) async {
    return await supabase
        .from("${mealType}_list")
        .select('*')
        .eq('user_id', userId)
        .eq('id', parentId);
  }

  Future<PostgrestList> getItemDialog({
    required String mealType,
    required String id,
  }) async {
    return await supabase
        .from(mealType)
        .select('*')
        .eq('user_id', userId)
        .eq('id', id);
  }

  late final breakfastData = supabase
      .from('breakfast')
      .stream(primaryKey: ['id']).eq('user_id', userId);
  late final lunchData =
      supabase.from('lunch').stream(primaryKey: ['id']).eq('user_id', userId);
  late final dinnerData =
      supabase.from('dinner').stream(primaryKey: ['id']).eq('user_id', userId);
  late final snacksData =
      supabase.from('snacks').stream(primaryKey: ['id']).eq('user_id', userId);

  MealData();
}
