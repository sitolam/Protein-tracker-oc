import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:EzNutri/common/widgets/buttons/sign_out.dart';
import 'package:EzNutri/common/widgets/buttons/text_button.dart';
import 'package:EzNutri/common/widgets/future/future_widget.dart';
import 'package:EzNutri/common/widgets/input_fields/input_field.dart';
import 'package:EzNutri/core/riverpod/riverpod.dart';
import 'package:EzNutri/presentation/popups/acount_management/change_password.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Settings"),
      ),
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(children: [
                CustomFutureBuilder(
                    loadingWidget: const LoadingWidget(),
                    future: ref.read(userData).userName,
                    builder: (context, data) {
                      String userName = data[0]['username'];
                      return CustomFutureBuilder(
                          future: ref.read(userData).weight,
                          builder: (context, data) {
                            num weight = data[0]['weight'];
                            return CustomFutureBuilder(
                              loadingWidget: const LoadingWidget(),
                              future: ref.read(userData).proteinRatio,
                              builder: (context, data) {
                                num proteinRatio =
                                    data[0]['protein_ratio'].toDouble();

                                final usernameInputField = InputField(
                                  hint: "Name",
                                  value: userName.toString(),
                                );

                                final weightInputField = InputField(
                                  hint: "Weight (kg)",
                                  value: weight.toString(),
                                  keyboardType: TextInputType.number,
                                );

                                final proteinratioInputField = InputField(
                                  hint: "Protein Ratio",
                                  value: proteinRatio.toString(),
                                  keyboardType: TextInputType.number,
                                );

                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const CircleAvatar(
                                        radius: 100,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.image),
                                        label: const Text(
                                            'Change Profile Picture'),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: weightInputField,
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: proteinratioInputField,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: usernameInputField,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      CustomFutureBuilder(
                                          loadingWidget: ButtonText(
                                              text: "Update", onPressed: () {}),
                                          future: ref.read(userData).weight,
                                          builder: (context, data) {
                                            double weight =
                                                data[0]['weight'].toDouble();
                                            return ButtonText(
                                              text: "Update",
                                              onPressed: () {
                                                if (usernameInputField
                                                        .controller.text !=
                                                    '') {
                                                  ref.read(userData).updateName(
                                                      usernameInputField
                                                          .controller.text);
                                                }
                                                if (weightInputField
                                                        .controller.text !=
                                                    '') {
                                                  ref
                                                      .read(userData)
                                                      .updateWeight(
                                                          double.parse(
                                                              weightInputField
                                                                  .controller
                                                                  .text));
                                                  weight = double.parse(
                                                      weightInputField
                                                          .controller.text);
                                                }
                                                if (proteinratioInputField
                                                        .controller.text !=
                                                    '') {
                                                  ref
                                                      .read(userData)
                                                      .updateProteinRatio(
                                                          double.parse(
                                                              proteinratioInputField
                                                                  .controller
                                                                  .text));
                                                  proteinRatio = double.parse(
                                                      proteinratioInputField
                                                          .controller.text);
                                                }
                                                ref
                                                    .read(userData)
                                                    .updateGoalIntake(
                                                        (proteinRatio * weight)
                                                            .round());
                                                sleep(const Duration(
                                                    milliseconds: 250));
                                                ref.invalidate(userData);
                                                Navigator.of(context).pop();
                                                ref.invalidate(userData);
                                              },
                                            );
                                          })
                                    ]);
                              },
                            );
                          });
                    }),
                ButtonText(
                  text: "Change password",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePassword()));
                  },
                ),
                const SignOutWidget(
                  style: Style.secondary,
                )
              ]))
        ],
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const CircleAvatar(
          radius: 100,
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.image),
          label: const Text('Change Profile Picture'),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: InputField(
                  hint: 'Weight (kg)',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: InputField(
                  hint: 'Protein Ratio',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: InputField(hint: 'Name'),
        ),
        const SizedBox(
          height: 20,
        ),
        ButtonText(
          text: "Update",
          onPressed: () {},
        )
      ]),
    ]);
  }
}
