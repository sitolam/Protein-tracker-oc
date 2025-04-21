// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:EzNutri/common/widgets/selection/single_choice_selection.dart';
import 'package:EzNutri/presentation/pages/tracker/widgets/progress_bar.dart';

class Tracker extends StatelessWidget {
  const Tracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Tracker',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ProgressBar(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChoice(
          container: SelectionChoice.favourites,
        ),
      ),
    );
  }
}
