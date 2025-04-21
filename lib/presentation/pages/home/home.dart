import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:EzNutri/common/widgets/future/future_widget.dart';
import 'package:EzNutri/core/riverpod/riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:EzNutri/common/widgets/selection/single_choice_selection.dart';
import 'package:EzNutri/presentation/popups/profile/profile.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.invalidate(mealData);
    ref.invalidate(userData);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              child: const CircleAvatar(
                radius: 20,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome Back", style: TextStyle(fontSize: 12)),
                CustomFutureBuilder(
                  loadingWidget: const Text("Loading..."),
                  future: ref.watch(userData).userName,
                  builder: (context, data) {
                    final name = data;
                    return Text(name[0]['username'].toString());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Center(
              child: CustomFutureBuilder(
                  loadingWidget: const CircularPercentIndicatorLoading(),
                  future: ref.watch(mealData).sumProteins(),
                  builder: (context, data) {
                    final currentIntake = data;
                    return CustomFutureBuilder(
                        loadingWidget: const CircularPercentIndicatorLoading(),
                        future: ref.watch(userData).goalIntake,
                        builder: (context, data) {
                          final goalIntake = data[0]['goal_intake'];
                          return CircularPercentIndicator(
                              radius: 150.0,
                              lineWidth: 13.0,
                              animation: true,
                              percent: currentIntake / goalIntake > 1
                                  ? 1
                                  : currentIntake / goalIntake,
                              center: Column(
                                children: [
                                  const SizedBox(height: 110),
                                  Text(
                                      "${int.parse(((currentIntake / goalIntake) * 100).toStringAsFixed(0))}%",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                      )),
                                  GestureDetector(
                                    child: Text(
                                        "${currentIntake.round()} of $goalIntake grams",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Profile()));
                                    },
                                  ),
                                ],
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor:
                                  Theme.of(context).colorScheme.inversePrimary);
                        });
                  })),
          const SizedBox(
            height: 30,
          ),
          const Expanded(
              child: SingleChoice(container: SelectionChoice.intakeList))
        ]),
      ),
    );
  }
}

class CircularPercentIndicatorLoading extends StatelessWidget {
  const CircularPercentIndicatorLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 150.0,
      lineWidth: 13.0,
      animation: true,
      percent: 0,
      center: Column(
        children: [
          const SizedBox(height: 110),
          const Text("0%",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              )),
          GestureDetector(
            child: const Text("0 of 0 grams",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Profile()));
            },
          ),
        ],
      ),
    );
  }
}
