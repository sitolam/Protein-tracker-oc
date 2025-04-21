import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:EzNutri/core/extensions/capitalize.dart';
import 'package:EzNutri/core/riverpod/riverpod.dart';
import 'package:EzNutri/presentation/pages/home/widgets/intake_list.dart';
import 'package:EzNutri/presentation/pages/tracker/widgets/favourites_list.dart';

enum SelectionChoice { intakeList, favourites }

enum Meals { breakfast, lunch, dinner, snacks }

class SingleChoice extends ConsumerWidget {
  final SelectionChoice container;
  const SingleChoice({super.key, required this.container});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SegmentedButton<Meals>(
          segments: const <ButtonSegment<Meals>>[
            ButtonSegment<Meals>(
              value: Meals.breakfast,
              icon: Icon(Icons.free_breakfast),
            ),
            ButtonSegment<Meals>(
              value: Meals.lunch,
              icon: Icon(Icons.lunch_dining),
            ),
            ButtonSegment<Meals>(
              value: Meals.dinner,
              icon: Icon(Icons.restaurant),
            ),
            ButtonSegment<Meals>(
              value: Meals.snacks,
              icon: Icon(Icons.fastfood),
            ),
          ],
          selected: <Meals>{ref.watch(appStates).mealPage},
          onSelectionChanged: (Set<Meals> newSelection) {
            ref.read(appStates).updateMealPage(newSelection.first);
          },
        ),
        const SizedBox(height: 20),
        Text(
          ref.watch(appStates).mealPage.name.capitalize(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: container == SelectionChoice.intakeList
              ? IntakeList(
                  meal: ref.watch(appStates).mealPage,
                  mealName: ref.watch(appStates).mealPage.name,
                )
              : FavouritesList(
                  meal: ref.watch(appStates).mealPage,
                  mealName: ref.watch(appStates).mealPage.name,
                ),
        ),
      ],
    );
  }
}
