import 'package:EzNutri/common/widgets/input_fields/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:EzNutri/common/widgets/dialog/dialog_list_view.dart';

enum ActionType { add, edit, customAdd }

class FavouriteDialog extends ConsumerWidget {
  final ActionType actionType;
  final String title;
  final String? name;
  final String mealType;
  final String id;
  final ChangeNotifierProvider provider;

  const FavouriteDialog({
    super.key,
    required this.provider,
    required this.actionType,
    required this.title,
    required this.mealType,
    this.id = 'empty',
    this.name,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleInputField = InputField(
      hint: 'Name',
      value: name ?? '',
    );
    if (actionType == ActionType.add) {
      return Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            title: titleInputField,
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: DialogListView(
                actionType: actionType,
                provider: provider,
                title: titleInputField,
                mealType: mealType,
                type: title,
              )));
    } else {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: titleInputField,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: DialogListView(
              actionType: actionType,
              provider: provider,
              title: titleInputField,
              id: id,
              mealType: mealType,
              type: title,
            )),
      );
    }
  }
}
