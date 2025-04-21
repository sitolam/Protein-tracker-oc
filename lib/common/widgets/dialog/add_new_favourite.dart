import 'package:EzNutri/common/widgets/buttons/text_button.dart';
import 'package:EzNutri/common/widgets/input_fields/input_field.dart';
import 'package:EzNutri/core/riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewFavourite extends ConsumerStatefulWidget {
  final String type;
  final InputField title;
  final String mealType;
  const AddNewFavourite({
    super.key,
    required this.type,
    required this.title,
    required this.mealType,
  });

  @override
  ConsumerState<AddNewFavourite> createState() => _AddNewFavouriteState();
}

class _AddNewFavouriteState extends ConsumerState<AddNewFavourite> {
  List<Map<String, InputField>> items = [
    {
      'nameInputField': InputField(hint: 'Name'),
      'weightInputField':
          InputField(hint: 'Weight (g)', keyboardType: TextInputType.number),
      'proteinDensityInputField': InputField(
        hint: 'Protein Density (%)',
        keyboardType: TextInputType.number,
      )
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Theme.of(context).dividerColor),
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
                            Expanded(child: items[index]['weightInputField']!),
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
      ButtonText(
          text: widget.type,
          onPressed: () {
            List itemsList = [];
            num proteins = 0;
            num weight = 0;
            for (var item in items) {
              proteins += double.parse(
                      item['weightInputField']!.controller.text.toString()) *
                  double.parse(
                      item['proteinDensityInputField']!.controller.text) /
                  100;
              weight += double.parse(
                  item['weightInputField']!.controller.text.toString());
              itemsList.add({
                'name': items.length > 1
                    ? item['nameInputField']!.controller.text.toString()
                    : widget.title.controller.text,
                'weight': double.parse(
                    item['weightInputField']!.controller.text.toString()),
                'proteinDensity': (double.parse(
                            item['proteinDensityInputField']!.controller.text) /
                        100)
                    .toDouble()
              });
            }
            ref.read(mealDataOptions).addNew(
                  mealType: widget.mealType,
                  name: widget.title.controller.text,
                  proteins: proteins,
                  weight: weight,
                  items: itemsList,
                );
            Navigator.pop(context);
          })
    ]);
  }
}
