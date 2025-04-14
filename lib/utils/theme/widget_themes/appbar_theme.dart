import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class TAppBarTheme{
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Color.from(alpha: 1, red: 0.965, green: 0.031, blue: 0.031),
    surfaceTintColor: Color.fromARGB(212, 233, 52, 52),
    iconTheme: IconThemeData(color: TColors.primary, size: TSizes.iconMd),
    actionsIconTheme: IconThemeData(color: TColors.primary, size: TSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 216, 11, 168)),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Color.fromARGB(255, 10, 99, 41),
    surfaceTintColor: Color.fromARGB(67, 10, 99, 41),
    iconTheme: IconThemeData(color: Color.fromARGB(255, 171, 17, 130), size: TSizes.iconMd),
    actionsIconTheme: IconThemeData(color: TColors.white, size: TSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.white),
  );
}