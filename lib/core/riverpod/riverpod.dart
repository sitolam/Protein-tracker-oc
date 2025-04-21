import 'package:EzNutri/core/riverpod/models/app_states.dart';
import 'package:EzNutri/core/riverpod/models/meal_data.dart';
import 'package:EzNutri/core/riverpod/models/meal_data_options.dart';
import 'package:EzNutri/core/riverpod/models/user_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:EzNutri/common/widgets/selection/single_choice_selection.dart';

final userData = ChangeNotifierProvider<UserData>((ref) {
  return UserData();
});

final mealData = ChangeNotifierProvider<MealData>((ref) {
  return MealData();
});

final mealDataOptions = ChangeNotifierProvider<MealDataOptions>((ref) {
  return MealDataOptions();
});

final appStates = ChangeNotifierProvider<AppStates>((ref) {
  return AppStates(mealPage: Meals.breakfast, currentPageIndex: 0);
});
