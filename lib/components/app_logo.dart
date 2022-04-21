import 'package:flutter/material.dart';
import 'package:flutter_desktop_2/utils/text_styles.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            AntDesign.checkcircleo,
            color: Colors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'QuickList',
            style: TextStyles.secondary.apply(
              color: Colors.white,
              fontSizeDelta: 10,
              fontWeightDelta: 5,
            ),
          ),
        ],
      );
}
