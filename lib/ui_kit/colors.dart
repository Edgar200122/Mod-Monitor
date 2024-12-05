import 'package:flutter/material.dart';

abstract class AppColors {
  static const primary = Color(0xffFDF7E0);
  static const black = Color(0xff000000);
  static const yellow = Color(0xffE1BC29);
  static const purple = Color(0xff7768AE);
  static const secondary = Color(0xff16161a);
  static const gray = Color(0xff67645F);
  static const red = Color(0xffE15554);
  static const bottomBarColor = Color(0xff4D9DE0);
  static const blue = Color(0xFF6EC1FD);
  static const green = Color(0xff3BB273);
  static final onPrimary = secondary.withOpacity(.4);
  static final onBackground = secondary.withOpacity(.08);
}
