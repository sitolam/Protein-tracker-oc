import 'dart:convert';

import 'package:EzNutri/common/widgets/dialog/add_new_favourite.dart';
import 'package:EzNutri/common/widgets/dialog/edit_custom_add.dart';
import 'package:EzNutri/common/widgets/future/future_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:EzNutri/core/riverpod/riverpod.dart';
import 'package:EzNutri/common/widgets/dialog/dialog.dart';

class DialogListView extends ConsumerWidget {
  final ActionType actionType;
  final ChangeNotifierProvider provider;
  final dynamic title;
  final String mealType;
  final String? id;
  final String type;

  const DialogListView({
    super.key,
    required this.actionType,
    required this.provider,
    required this.title,
    required this.mealType,
    required this.type,
    this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (provider == mealDataOptions) {
      return FutureBuilder(
          future: ref.watch(mealDataOptions).getItem(
                mealType: mealType,
                id: id ?? 'empty',
              ),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return AddNewFavourite(
                type: type,
                title: title,
                mealType: mealType,
              );
            } else {
              final data = snapshot.data!;
              final weight = data[0]['weight'];
              final proteins = data[0]['proteins'];
              final name = data[0]['name'];
              final items = data[0]['items'];
              final currentUsage = data[0]['usage'];
              final id = data[0]['id'];

              return EditCustomAdd(
                provider: provider,
                actionType: actionType,
                title: title,
                id: id,
                mealType: mealType,
                name: name,
                weight: weight,
                proteins: proteins,
                currentUsage: currentUsage,
                items: json.decode(items),
                type: type,
              );
            }
          });
    } else {
      return CustomFutureBuilder(
          future: ref.watch(mealData).getItemDialog(
                mealType: mealType,
                id: id ?? 'empty',
              ),
          builder: (context, data) {
            final weight = data[0]['weight'];
            final proteins = data[0]['proteins'];
            final name = data[0]['name'];
            final items = data[0]['items'];
            final id = data[0]['id'];

            return EditCustomAdd(
              provider: provider,
              actionType: actionType,
              title: title,
              id: id,
              mealType: mealType,
              name: name,
              weight: weight,
              proteins: proteins,
              items: json.decode(items),
              type: type,
            );
          });
    }
  }
}
