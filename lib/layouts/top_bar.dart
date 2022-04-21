import 'package:flutter/material.dart';
import 'package:flutter_desktop_2/components/search_bar.dart';
import 'package:flutter_desktop_2/components/user_avatar.dart';
import 'package:flutter_desktop_2/providers/app_controller.dart';
import 'package:flutter_desktop_2/utils/text_styles.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:get/get.dart';

import '../constants.dart';

class TopBar extends GetView<AppController> {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final bool _isNotSm = _size.width >= screenSm;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: .3,
            color: darkColor.withOpacity(.2),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _isNotSm ? 24 : 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: SearchBar(),
                ),
                // const Spacer(),
                const Spacer(),
                TextButton.icon(
                  icon: const Icon(
                    Ionicons.ios_arrow_down,
                    color: textColor,
                    size: 16,
                  ),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 12,
                    ),
                    side: const BorderSide(color: textColor),
                    backgroundColor: Colors.transparent,
                    enableFeedback: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  label: Text(
                    ' Notebook: UX Design Brainstorming',
                    style: TextStyles.secondary.apply(
                      color: textColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                const Icon(
                  Entypo.bell,
                  color: darkColor,
                ),
                const SizedBox(
                  width: 12,
                ),
                const UserAvatar(size: 40).buildAvatar('51.jpg')
              ],
            ),
          )
        ],
      ),
    );
  }
}
