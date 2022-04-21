import 'dart:math';

import 'package:flutter/material.dart';

mixin AppColors {
  static get orange => const Color(0xffFEB2B2);

  static get yellow => const Color(0xffFBD38D);

  static get pink => const Color(0xffFBB5CD);

  static get grey => const Color(0xffE1E8F0);

  static get blue => const Color(0xff8FCDF4);

  static get white => const Color(0xffffffff);

  static List<Color> get values => [orange, yellow, pink, grey, blue, white, white];

  static Color get random => values[Random().nextInt(values.length)];
}
