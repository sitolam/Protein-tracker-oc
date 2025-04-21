import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:EzNutri/common/widgets/future/future_widget.dart';
import 'package:EzNutri/core/riverpod/riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressBar extends ConsumerWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomFutureBuilder(
        loadingWidget: const LinearPercentIndicatorLoading(),
        future: ref.watch(mealData).sumProteins(),
        builder: (context, data) {
          final currentIntake = data;
          return CustomFutureBuilder(
              loadingWidget: const LinearPercentIndicatorLoading(),
              future: ref.watch(userData).goalIntake,
              builder: (context, data) {
                final goalIntake = data[0]['goal_intake'];
                return LinearPercentIndicator(
                  lineHeight: 8.0,
                  percent: currentIntake / goalIntake > 1
                      ? 1
                      : currentIntake / goalIntake,
                  progressColor: Theme.of(context).colorScheme.inversePrimary,
                  backgroundColor: Colors.transparent,
                  barRadius: const Radius.circular(20),
                );
              });
        });
  }
}

class LinearPercentIndicatorLoading extends StatelessWidget {
  const LinearPercentIndicatorLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 8.0,
      percent: 0,
      progressColor: Theme.of(context).colorScheme.inversePrimary,
      backgroundColor: Colors.transparent,
      barRadius: const Radius.circular(20),
    );
  }
}
