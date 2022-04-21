import 'package:flutter/material.dart';
import 'package:flutter_desktop_2/layouts/side_bar.dart';
import 'package:flutter_desktop_2/utils/text_styles.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';

import 'side_bar_label_item.dart';

class MenuItemsLabelSection extends StatelessWidget {
  const MenuItemsLabelSection({
    Key? key,
    required this.isDesktop,
  }) : super(key: key);
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: isDesktop
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (isDesktop)
              Text(
                "Labels".toUpperCase(),
                style: TextStyles.secondary.apply(
                  color: Colors.white38,
                  fontSizeDelta: 2,
                  fontWeightDelta: -4,
                ),
              ),
            const Icon(
              AntDesign.plus,
              color: Colors.white38,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        ...labelItems
            .map((e) => SideBarLabelItem(
                  color: e.color!,
                  label: e.label,
                  isDesktop: isDesktop,
                ))
            .toList(),
      ],
    );
  }
}
