import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomFutureBuilder extends StatelessWidget {
  final Future future;
  final Widget Function(BuildContext context, dynamic data) builder;
  final Widget? loadingWidget;

  const CustomFutureBuilder({
    super.key,
    required this.future,
    required this.builder,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        while (!snapshot.hasData) {
          return loadingWidget ??
              Center(
                  child: SpinKitPulse(
                      color: Theme.of(context).colorScheme.primary));
        }
        sleep(Duration.zero);
        final data = snapshot.data!;
        return builder(context, data);
      },
    );
  }
}
