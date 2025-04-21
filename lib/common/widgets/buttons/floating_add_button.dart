import 'package:flutter/material.dart';

class FloatingAddButton extends StatelessWidget {
  final Function() onPressed;
  final double padding;
  final String toolTip;
  const FloatingAddButton({
    super.key,
    required this.onPressed,
    this.padding = 0,
    required this.toolTip,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: padding,
      right: padding,
      child: FloatingActionButton(
          tooltip: toolTip,
          onPressed: () => onPressed(),
          elevation: 0,
          child: const Icon(Icons.add)),
    );
  }
}
