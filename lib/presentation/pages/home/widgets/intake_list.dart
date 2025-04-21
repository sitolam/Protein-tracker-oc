import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:EzNutri/common/functions/change_detector.dart';
import 'package:EzNutri/common/widgets/buttons/floating_add_button.dart';
import 'package:EzNutri/core/riverpod/riverpod.dart';
import 'package:EzNutri/common/widgets/selection/single_choice_selection.dart';
import 'package:EzNutri/main.dart';
import 'package:EzNutri/common/functions/modal_bottom_sheet.dart';

class IntakeList extends ConsumerWidget {
  final Meals meal;
  final String mealName;

  const IntakeList({super.key, required this.meal, required this.mealName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ChangeDetector(
        name: mealName, provider: mealData, ref: ref, context: context);
    final String intakeListString = mealName;
    return Stack(
      children: [
        StreamBuilder(
            stream: supabase.from(mealName).stream(primaryKey: ['id']),
            builder: (context, snapshot) {
              final meal = snapshot.data ?? [];
              return ListView.builder(
                itemCount: meal.length,
                itemBuilder: (context, index) {
                  final item = meal[index];
                  List<Widget> subtitles = [];

                  item.forEach((key, value) {
                    if (key.startsWith('quantity')) {
                      final weightKey = 'weight${key.substring(8)}';
                      final proteinsKey = 'proteins${key.substring(8)}';
                      if (item.containsKey(weightKey)) {
                        subtitles.add(
                          RichText(
                            text: TextSpan(
                                text:
                                    '${item[proteinsKey].toStringAsFixed(2)}g  •  ',
                                style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                      text: '$value x ${item[weightKey]}g',
                                      style: const TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.normal,
                                      )),
                                ]),
                          ),
                        );
                      }
                    }
                  });

                  return SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title: Text(item['name'],
                                style: const TextStyle(fontSize: 18)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: subtitles,
                            ),
                            onTap: () {
                              customModelBottomSheet(
                                  context: context,
                                  ref: ref,
                                  id: item['id'],
                                  name: item['name'],
                                  mealType: intakeListString,
                                  weight: item['weight'],
                                  proteins: item['proteins'],
                                  items: json.decode(item['items']),
                                  provider: mealData);
                            },
                            onLongPress: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Confirm Delete'),
                                    content: const Text(
                                        'Are you sure you want to delete this item?'),
                                    actions: [
                                      TextButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Delete'),
                                        onPressed: () {
                                          ref.read(mealData).delete(
                                              intakeListString, item['id']);
                                          // ignore: use_build_context_synchronously
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            tileColor: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
        FloatingAddButton(
          toolTip: 'Add new intake',
          padding: 5,
          onPressed: () {
            ref.read(appStates).updateCurrentPageIndex(1);
          },
        )
      ],
    );
  }
}
