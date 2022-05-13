import 'package:flutter/material.dart';
import 'package:get/get.dart';

double get pixelRatio => MediaQuery.of(Get.context!).devicePixelRatio;

double get screenWidth {
  return MediaQuery.of(Get.context!).size.width;
}

double get screenHeight {
  return MediaQuery.of(Get.context!).size.height;
}

bool get isWide => screenHeight < screenWidth;

//Calculate equivalent of size in design to size in screen height
double eqH(double inDesign) => inDesign / 886 * screenHeight;

//Calculate equivalent of size in design to size in screen Width
double eqW(double inDesign) => inDesign / 414 * screenWidth;

EdgeInsetsGeometry pad({
  double horiz: 0,
  double vert: 0,
  double? both,
}) =>
    EdgeInsets.symmetric(
      horizontal: eqW(both ?? horiz),
      vertical: eqH(both ?? vert),
    );
