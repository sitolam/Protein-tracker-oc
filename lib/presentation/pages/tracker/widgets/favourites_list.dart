import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:EzNutri/common/functions/change_detector.dart';
import 'package:EzNutri/common/widgets/buttons/floating_add_button.dart';
import 'package:EzNutri/main.dart';
import 'package:EzNutri/common/widgets/dialog/dialog.dart';
import 'package:EzNutri/presentation/pages/tracker/widgets/favourites_listview_builder.dart';
import 'package:EzNutri/core/riverpod/riverpod.dart';
import 'package:EzNutri/common/widgets/selection/single_choice_selection.dart';

class FavouritesList extends ConsumerWidget {
  final Meals meal;
  final String mealName;

  const FavouritesList({
    super.key,
    required this.meal,
    required this.mealName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ChangeDetector(
        context: context,
        name: "${mealName}_list",
        provider: mealDataOptions,
        ref: ref);
    ChangeDetector(
        context: context, name: mealName, provider: mealData, ref: ref);
    return StreamBuilder(
        stream: supabase
            .from("${mealName}_list")
            .stream(primaryKey: ['id'])
            .order('name')
            .order('usage'),
        builder: (context, data) {
          final meal = data.data ?? [];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Stack(
              children: [
                SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Card(
                                color: Theme.of(context).cardColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: FavouritesListviewBuilder(
                                  list:
                                      ref.watch(mealDataOptions).list(meal)[0],
                                  mealType: mealName,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                color: Theme.of(context).cardColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: FavouritesListviewBuilder(
                                  list:
                                      ref.watch(mealDataOptions).list(meal)[1],
                                  mealType: mealName,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                FloatingAddButton(
                  toolTip: "Add new favourite",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FavouriteDialog(
                        provider: mealDataOptions,
                        actionType: ActionType.add,
                        title: "Add new favourite",
                        mealType: mealName,
                      );
                    }));
                  },
                )
              ],
            ),
          );
        });
  }
}
