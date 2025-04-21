import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:EzNutri/core/riverpod/riverpod.dart';

Future<dynamic> deleteDialog({
  required String mealType,
  required BuildContext context,
  required String id,
  num? amount,
  num? proteins,
  required WidgetRef ref,
  required String message,
  Function()? extraAction,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Delete'),
        content: Text(message),
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
              if (amount != null && amount > 1) {
                ref.read(mealData).updateAmount(
                      id: id,
                      mealType: mealType,
                      amount: amount - 1,
                      proteins: proteins!,
                    );
              } else {
                ref.read(mealData).delete(mealType, id);
              }
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
              if (extraAction != null) {
                extraAction();
              }
            },
          ),
        ],
      );
    },
  );
}
