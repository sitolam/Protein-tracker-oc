import 'dart:convert';

import 'package:EzNutri/common/widgets/buttons/text_button.dart';
import 'package:EzNutri/common/widgets/dialog/dialog.dart';
import 'package:EzNutri/common/widgets/future/future_widget.dart';
import 'package:EzNutri/common/widgets/input_fields/input_field.dart';
import 'package:EzNutri/core/functions/are_lists_equal.dart';
import 'package:EzNutri/core/riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditCustomAdd extends ConsumerStatefulWidget {
  final ChangeNotifierProvider provider;
  final ActionType actionType;
  final String mealType;
  final String name;
  final num weight;
  final num proteins;
  final int? currentUsage;
  final List items;
  final String id;
  final InputField title;
  final String type;
  const EditCustomAdd({
    super.key,
    required this.provider,
    required this.actionType,
    required this.type,
    required this.mealType,
    required this.name,
    required this.weight,
    required this.proteins,
    this.currentUsage,
    required this.items,
    required this.id,
    required this.title,
  });

  @override
  ConsumerState<EditCustomAdd> createState() => _EditCustomAddState();
}

class _EditCustomAddState extends ConsumerState<EditCustomAdd> {
  List items = [];

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
        future: widget.provider == mealDataOptions
            ? ref.watch(mealDataOptions).getItem(
                  mealType: widget.mealType,
                  id: widget.id,
                )
            : ref
                .watch(mealData)
                .getItemDialog(mealType: widget.mealType, id: widget.id),
        builder: (context, data) {
          final List currentItems = json.decode(data[0]['items']);
          if (items.isEmpty) {
            for (var item in currentItems) {
              items.add(
                {
                  'nameInputField': InputField(
                    hint: 'Name',
                    value: item['name'],
                  ),
                  'weightInputField': InputField(
                    hint: 'Weight (g)',
                    keyboardType: TextInputType.number,
                    value: item['weight'].toString(),
                  ),
                  'proteinDensityInputField': InputField(
                    hint: 'Protein Density (%)',
                    keyboardType: TextInputType.number,
                    value: (item['proteinDensity'] * 100).toStringAsFixed(2),
                  )
                },
              );
            }
          }
          final InputField amountInputField = InputField(
            hint: '1',
            label: 'Amount',
            value: widget.actionType == ActionType.edit
                ? data[0]['quantity'].toString()
                : '',
            keyboardType: TextInputType.number,
          );
          return ListView(children: [
            if (widget.actionType == ActionType.customAdd ||
                widget.provider == mealData)
              const SizedBox(
                height: 12,
              ),
            if (widget.actionType == ActionType.customAdd ||
                widget.provider == mealData)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: amountInputField,
              ),
            if (widget.actionType == ActionType.customAdd ||
                widget.provider == mealData)
              const SizedBox(
                height: 12,
              ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                  color: Theme.of(context).dividerColor),
                            ),
                            color: Theme.of(context).cardColor,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: ListTile(
                                  title: Column(children: [
                                items.length > 1
                                    ? items[index]['nameInputField']!
                                    : Container(),
                                SizedBox(
                                  height: items.length > 1 ? 12 : 0,
                                ),
                                Row(children: [
                                  Expanded(
                                      child: items[index]['weightInputField']!),
                                  const SizedBox(width: 12),
                                  Expanded(
                                      child: items[index]
                                          ['proteinDensityInputField']!),
                                ]),
                                if (items.length > 1)
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          items.removeAt(index);
                                        });
                                      },
                                      icon: const Icon(
                                          size: 20, Icons.delete_outlined)),
                              ])),
                            )),
                      )
                    ],
                  );
                }),
            const SizedBox(
              height: 12,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    items.add({
                      'nameInputField': InputField(
                        hint: 'Name',
                      ),
                      'weightInputField': InputField(
                        hint: 'Weight (g)',
                        keyboardType: TextInputType.number,
                      ),
                      'proteinDensityInputField': InputField(
                        hint: 'Protein Density (%)',
                        keyboardType: TextInputType.number,
                      )
                    });
                  });
                },
                icon: const Icon(Icons.add)),
            const SizedBox(
              height: 12,
            ),
            FutureBuilder(
                future: ref.watch(mealData).getItem(
                      mealType: widget.mealType,
                      name: widget.title.controller.text,
                      items: widget.items,
                    ),
                builder: (context, snapshot) {
                  if (widget.actionType == ActionType.customAdd ||
                      widget.provider == mealData) {
                    // custom add or mealData
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      // mealData or custom add with existing data
                      final data = snapshot.data;
                      final dataName = data![0]['name'];
                      final dataItems = data[0]['items'];
                      final parentId = data[0]['parent_id'];
                      final dataId = data[0]['id'];
                      final dataCurrentAmount = data[0]['quantity'];

                      return FutureBuilder(
                          future: ref.watch(mealData).getParentItem(
                              mealType: widget.mealType, parentId: parentId),
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                              // mealData and customAdd with existing data
                              return ButtonText(
                                  text: widget.type,
                                  onPressed: () {
                                    List itemsList = [];
                                    num proteins = 0;
                                    num weight = 0;
                                    for (var item in items) {
                                      proteins += double.parse(
                                              item['weightInputField']!
                                                  .controller
                                                  .text
                                                  .toString()) *
                                          double.parse(
                                              item['proteinDensityInputField']!
                                                  .controller
                                                  .text) /
                                          100;

                                      weight += double.parse(
                                          item['weightInputField']!
                                              .controller
                                              .text
                                              .toString());

                                      itemsList.add({
                                        'name': items.length > 1
                                            ? item['nameInputField']!
                                                .controller
                                                .text
                                                .toString()
                                            : widget.title.controller.text,
                                        'weight': double.parse(
                                            item['weightInputField']!
                                                .controller
                                                .text
                                                .toString()),
                                        'proteinDensity': (double.parse(item[
                                                        'proteinDensityInputField']!
                                                    .controller
                                                    .text) /
                                                100)
                                            .toDouble()
                                      });
                                    }
                                    if (widget.title.controller.text ==
                                            dataName &&
                                        areListsEqual(itemsList,
                                            json.decode(dataItems))) {
                                      // checks if data is the same after editing not amount checking
                                      if (widget.actionType ==
                                          ActionType.customAdd) {
                                        ref.read(mealData).updateAmount(
                                              id: dataId,
                                              mealType: widget.mealType,
                                              amount: num.parse(amountInputField
                                                              .controller
                                                              .text !=
                                                          ''
                                                      ? amountInputField
                                                          .controller.text
                                                      : '1') +
                                                  dataCurrentAmount,
                                              proteins: proteins,
                                            );
                                      } else if (widget.actionType ==
                                          ActionType.edit) {
                                        ref.read(mealData).update(
                                              mealType: widget.mealType,
                                              id: dataId,
                                              name:
                                                  widget.title.controller.text,
                                              amount: num.parse(amountInputField
                                                          .controller.text ==
                                                      ''
                                                  ? '1'
                                                  : amountInputField
                                                      .controller.text),
                                              proteins: proteins,
                                              weight: weight,
                                              items: itemsList,
                                            );
                                      }
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    } else {
                                      if (widget.actionType ==
                                          ActionType.customAdd) {
                                        ref.read(mealData).cloneAdd(
                                              context: context,
                                              mealType: widget.mealType,
                                              parentId: widget.id,
                                              name:
                                                  widget.title.controller.text,
                                              proteins: proteins,
                                              amount: int.parse(amountInputField
                                                          .controller.text ==
                                                      ''
                                                  ? '1'
                                                  : amountInputField
                                                      .controller.text),
                                              weight: weight,
                                              items: itemsList,
                                            );
                                      } else {
                                        ref.read(mealData).update(
                                              mealType: widget.mealType,
                                              id: widget.id,
                                              name:
                                                  widget.title.controller.text,
                                              amount: int.parse(amountInputField
                                                          .controller.text ==
                                                      ''
                                                  ? '1'
                                                  : amountInputField
                                                      .controller.text),
                                              proteins: proteins,
                                              weight: weight,
                                              items: itemsList,
                                            );
                                      }
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    }
                                  });
                            } else {
                              return ButtonText(
                                  text: widget.type,
                                  onPressed: () {
                                    List itemsList = [];
                                    num proteins = 0;
                                    num weight = 0;
                                    for (var item in items) {
                                      proteins += double.parse(
                                              item['weightInputField']!
                                                  .controller
                                                  .text
                                                  .toString()) *
                                          double.parse(
                                              item['proteinDensityInputField']!
                                                  .controller
                                                  .text) /
                                          100;

                                      weight += double.parse(
                                          item['weightInputField']!
                                              .controller
                                              .text
                                              .toString());

                                      itemsList.add({
                                        'name': items.length > 1
                                            ? item['nameInputField']!
                                                .controller
                                                .text
                                                .toString()
                                            : widget.title.controller.text,
                                        'weight': double.parse(
                                            item['weightInputField']!
                                                .controller
                                                .text
                                                .toString()),
                                        'proteinDensity': (double.parse(item[
                                                        'proteinDensityInputField']!
                                                    .controller
                                                    .text) /
                                                100)
                                            .toDouble()
                                      });
                                    }
                                    ref.read(mealData).update(
                                          mealType: widget.mealType,
                                          id: widget.id,
                                          name: widget.title.controller.text,
                                          amount: int.parse(amountInputField
                                                      .controller.text ==
                                                  ''
                                              ? '1'
                                              : amountInputField
                                                  .controller.text),
                                          proteins: proteins,
                                          weight: weight,
                                          items: itemsList,
                                        );

                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  });
                            }
                          });
                    } else {
                      // updating on mealData
                      return ButtonText(
                          text: widget.type,
                          onPressed: () {
                            List itemsList = [];
                            num proteins = 0;
                            num weight = 0;
                            for (var item in items) {
                              proteins += double.parse(item['weightInputField']!
                                      .controller
                                      .text
                                      .toString()) *
                                  double.parse(item['proteinDensityInputField']!
                                      .controller
                                      .text) /
                                  100;

                              weight += double.parse(item['weightInputField']!
                                  .controller
                                  .text
                                  .toString());

                              itemsList.add({
                                'name': items.length > 1
                                    ? item['nameInputField']!
                                        .controller
                                        .text
                                        .toString()
                                    : widget.title.controller.text,
                                'weight': double.parse(item['weightInputField']!
                                    .controller
                                    .text
                                    .toString()),
                                'proteinDensity': (double.parse(
                                            item['proteinDensityInputField']!
                                                .controller
                                                .text) /
                                        100)
                                    .toDouble()
                              });
                            }
                            ref.read(mealData).cloneAdd(
                                  context: context,
                                  mealType: widget.mealType,
                                  parentId: widget.id,
                                  name: widget.title.controller.text,
                                  proteins: proteins,
                                  amount: num.parse(
                                      amountInputField.controller.text == ''
                                          ? '1'
                                          : amountInputField.controller.text),
                                  weight: weight,
                                  items: itemsList,
                                );
                            Navigator.pop(context);
                            Navigator.pop(context);
                          });
                    }
                  } else {
                    return ButtonText(
                        text: widget.type,
                        onPressed: () {
                          List itemsList = [];
                          num proteins = 0;
                          num weight = 0;
                          for (var item in items) {
                            proteins += double.parse(item['weightInputField']!
                                    .controller
                                    .text
                                    .toString()) *
                                double.parse(item['proteinDensityInputField']!
                                    .controller
                                    .text) /
                                100;

                            weight += double.parse(item['weightInputField']!
                                .controller
                                .text
                                .toString());

                            itemsList.add({
                              'name': items.length > 1
                                  ? item['nameInputField']!
                                      .controller
                                      .text
                                      .toString()
                                  : widget.title.controller.text,
                              'weight': double.parse(item['weightInputField']!
                                  .controller
                                  .text
                                  .toString()),
                              'proteinDensity': (double.parse(
                                          item['proteinDensityInputField']!
                                              .controller
                                              .text) /
                                      100)
                                  .toDouble()
                            });
                          }
                          if (widget.provider == mealDataOptions) {
                            ref.read(mealDataOptions).update(
                                  mealType: widget.mealType,
                                  id: widget.id,
                                  name: widget.title.controller.text,
                                  proteins: proteins,
                                  weight: weight,
                                  items: itemsList,
                                );
                          } else {
                            ref.read(mealData).update(
                                  mealType: widget.mealType,
                                  id: widget.id,
                                  name: widget.title.controller.text,
                                  amount: amountInputField.controller.text != ''
                                      ? int.parse(
                                          amountInputField.controller.text)
                                      : 1,
                                  proteins: proteins,
                                  weight: weight,
                                  items: itemsList,
                                );
                          }
                          Navigator.pop(context);
                          Navigator.pop(context);
                        });
                  }
                })
          ]);
        });
  }
}
