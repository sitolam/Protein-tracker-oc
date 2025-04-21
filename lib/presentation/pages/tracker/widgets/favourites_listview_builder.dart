import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:EzNutri/common/functions/delete_dialog.dart';
import 'package:EzNutri/core/riverpod/riverpod.dart';
import 'package:EzNutri/common/functions/modal_bottom_sheet.dart';

class FavouritesListviewBuilder extends ConsumerWidget {
  final List list;
  final String mealType;
  const FavouritesListviewBuilder({
    super.key,
    required this.list,
    required this.mealType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        List<Widget> subtitles1 = [];

        item.forEach((key, value) {
          if (key.startsWith('protein_density')) {
            const weightKey = 'weight';
            if (item.containsKey(weightKey)) {
              subtitles1.add(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${item['proteins'].toStringAsFixed(2)}g",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "1 x ${item[weightKey]}g",
                    )
                  ],
                ),
              );
            }
          }
        });
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            title: Text(item['name'], style: const TextStyle(fontSize: 18)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: subtitles1,
            ),
            onTap: () {
              ref.read(mealDataOptions).updateUsage(
                  currentUsage: item['usage'],
                  id: item['id'],
                  mealType: mealType);
              customModelBottomSheet(
                provider: mealDataOptions,
                ref: ref,
                context: context,
                id: item['id'],
                name: item['name'],
                mealType: mealType,
                weight: item['weight'],
                proteins: item['proteins'],
                items: json.decode(item['items']),
              );
            },
            onLongPress: () async {
              deleteDialog(
                context: context,
                id: item['id'],
                ref: ref,
                mealType: "${mealType}_list",
                message: 'Are you sure you want to delete this item?',
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            tileColor: Theme.of(context).colorScheme.secondaryContainer,
          ),
        );
      },
    );
  }
}
