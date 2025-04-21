// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:EzNutri/core/riverpod/riverpod.dart';
import 'package:EzNutri/presentation/pages/home/home.dart';
import 'package:EzNutri/presentation/pages/tracker/tracker.dart';
import 'package:EzNutri/presentation/pages/statistics/statistics.dart';
import 'package:EzNutri/presentation/pages/settings/settings.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.track_changes),
              label: "Tracker",
            ),
            NavigationDestination(
              icon: Icon(Icons.pie_chart_rounded),
              label: "Statistics",
              enabled: false,
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: "Settings",
              enabled: false,
            ),
          ],
          selectedIndex: ref.watch(appStates).currentPageIndex,
          onDestinationSelected: (int index) {
            ref.read(appStates).updateCurrentPageIndex(index);
          },
        ),
        body: [
          Home(),
          Tracker(),
          Statistics(),
          Settings(),
        ][ref.watch(appStates).currentPageIndex],
      ),
    );
  }
}
