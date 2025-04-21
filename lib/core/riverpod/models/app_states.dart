import 'package:EzNutri/common/widgets/selection/single_choice_selection.dart';
import 'package:flutter/widgets.dart';

class AppStates extends ChangeNotifier {
  Meals mealPage;

  void updateMealPage(Meals newMealPage) {
    mealPage = newMealPage;
    notifyListeners();
  }

  int currentPageIndex;
  void updateCurrentPageIndex(int newPageIndex) {
    currentPageIndex = newPageIndex;
    notifyListeners();
  }

  AppStates({required this.mealPage, required this.currentPageIndex});
}
