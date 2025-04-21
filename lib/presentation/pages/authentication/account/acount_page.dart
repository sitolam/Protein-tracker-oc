import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:EzNutri/common/widgets/buttons/text_button.dart';
import 'package:EzNutri/common/widgets/input_fields/input_field.dart';
import 'package:EzNutri/core/navbar/nav_bar.dart';
import 'package:EzNutri/core/riverpod/riverpod.dart';

class AccountPage extends ConsumerWidget {
  final weightInputField = InputField(
    hint: "Weight",
    keyboardType: TextInputType.number,
  );
  final proteinratioInputField = InputField(
    hint: "Protein Ratio",
    keyboardType: TextInputType.number,
  );
  final usernameInputField = InputField(hint: "Username");

  AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  label: const Text('Change Profile Picture'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(child: weightInputField),
                      const SizedBox(width: 12),
                      Expanded(child: proteinratioInputField),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: usernameInputField),
                const SizedBox(
                  height: 20,
                ),
                ButtonText(
                  text: "Finish",
                  onPressed: () {
                    ref
                        .read(userData)
                        .updateName(usernameInputField.controller.text);
                    ref.read(userData).updateWeight(
                        double.parse(weightInputField.controller.text));
                    ref.read(userData).updateProteinRatio(
                        double.parse(proteinratioInputField.controller.text));
                    ref.read(userData).updateGoalIntake(
                        (double.parse(weightInputField.controller.text) *
                                double.parse(
                                    proteinratioInputField.controller.text))
                            .round());
                    ref.invalidate(userData);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
