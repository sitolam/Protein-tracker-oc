// TODO: turn this into a class

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:EzNutri/common/functions/delete_dialog.dart';
import 'package:EzNutri/common/widgets/future/future_widget.dart';
import 'package:EzNutri/core/riverpod/riverpod.dart';
import 'package:EzNutri/common/widgets/dialog/dialog.dart';

late final String id;
late final String name;
late final String mealType;
late final num weight;
late final num proteins;
late final List items;

void customModelBottomSheet({
  required BuildContext context,
  required WidgetRef ref,
  required String id,
  required String name,
  required String mealType,
  required num weight,
  required num proteins,
  required List items,
  required ChangeNotifierProvider provider,
}) {
  List<Widget> buttonList = <Widget>[
    FutureBuilder(
        future: ref.watch(mealData).getItem(
              mealType: mealType,
              name: name,
              items: items,
            ),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return CustomFutureBuilder(
                loadingWidget:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.copy)),
                future: ref
                    .watch(mealDataOptions)
                    .getItem(mealType: mealType, id: id),
                builder: (context, data) {
                  final currentUsage = data[0]['usage'];
                  return IconButton(
                    onPressed: () {
                      ref.read(mealData).cloneAdd(
                          context: context,
                          mealType: mealType,
                          parentId: id,
                          name: name,
                          proteins: proteins,
                          items: items,
                          amount: 1,
                          weight: weight);
                      ref.read(mealDataOptions).updateUsage(
                            id: id,
                            mealType: mealType,
                            currentUsage: currentUsage,
                          );
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.copy),
                  );
                });
          } else {
            final data = snapshot.data!;
            final currentAmount = data[0]['quantity'];
            final idItem = data[0]['id'];
            final parentId = data[0]['parent_id'];
            return CustomFutureBuilder(
                loadingWidget:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.copy)),
                future: ref
                    .watch(mealData)
                    .getParentItem(mealType: mealType, parentId: parentId),
                builder: (context, data) {
                  while (data.isEmpty) {
                    return IconButton(
                        onPressed: () {}, icon: const Icon(Icons.copy));
                  }
                  final currentUsage = data[0]['usage'];
                  return IconButton(
                    onPressed: () {
                      ref.read(mealData).updateAmount(
                            id: idItem,
                            mealType: mealType,
                            amount: currentAmount + 1,
                            proteins: provider == mealDataOptions
                                ? proteins
                                : proteins / currentAmount,
                          );
                      ref.read(mealDataOptions).updateUsage(
                            id: id,
                            mealType: mealType,
                            currentUsage: currentUsage,
                          );
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.copy),
                  );
                });
          }
        }),
    IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FavouriteDialog(
              provider: provider,
              actionType: ActionType.customAdd,
              title: 'Add',
              name: name,
              mealType: mealType,
              id: id,
            );
          }));
        },
        icon: const Icon(Icons.add)),
    IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FavouriteDialog(
              provider: provider,
              actionType: ActionType.edit,
              title: 'Edit',
              name: name,
              mealType: mealType,
              id: id,
            );
          }));
        },
        icon: const Icon(Icons.edit_outlined)),
    CustomFutureBuilder(
        loadingWidget: IconButton(
            onPressed: () {}, icon: const Icon(Icons.delete_outlined)),
        future: ref.watch(mealData).getItem(
              mealType: mealType,
              name: name,
              items: items,
            ),
        builder: (context, data) {
          final currentAmount = data!.isNotEmpty ? data![0]['quantity'] : null;
          return IconButton(
              onPressed: () {
                deleteDialog(
                  amount: currentAmount,
                  proteins: proteins / currentAmount,
                  mealType: provider == mealDataOptions
                      ? '${mealType}_list'
                      : mealType,
                  context: context,
                  id: id,
                  ref: ref,
                  message: "Are you sure you want to delete one item",
                  extraAction: () {
                    Navigator.pop(context);
                  },
                );
              },
              icon: const Icon(Icons.delete_outline));
        })
  ];
  List<Text> labelList = const <Text>[
    Text('Add'),
    Text('Custom Add'),
    Text('Edit'),
    Text('Delete'),
  ];

  buttonList = List.generate(
      buttonList.length,
      (index) => Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buttonList[index],
                labelList[index],
              ],
            ),
          ));

  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SizedBox(
          height: 150,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: buttonList,
          ),
        ),
      );
    },
  );
}
