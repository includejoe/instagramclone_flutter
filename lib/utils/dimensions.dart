import 'package:flutter/material.dart';

const webScreenSize = 600;

double screenHeight(BuildContext context) {
  final double statusBarHeight = MediaQuery.of(context).padding.top;
  final double navBarHeight = MediaQuery.of(context).padding.bottom;
  final double screenHeight = MediaQuery.of(context).size.height;
  final double availableHeight = screenHeight - statusBarHeight - navBarHeight;

  return availableHeight;
}