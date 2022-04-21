import 'package:flutter/material.dart';
import 'package:flutter_desktop_2/components/app_logo.dart';
import 'package:flutter_desktop_2/components/menu_items_label_section.dart';
import 'package:flutter_desktop_2/components/side_bar_label_item.dart';
import 'package:flutter_desktop_2/components/side_bar_menu_item.dart';
import 'package:flutter_desktop_2/providers/app_controller.dart';
import 'package:flutter_desktop_2/utils/text_styles.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../models/menu_item.dart';

List<MenuItem> topMenuItems = [
  MenuItem(
    null,
    'Dashboard',
    AntDesign.home,
  ),
  MenuItem(
    null,
    'Chat',
    AntDesign.message1,
  ),
  MenuItem(
    null,
    'Teams',
    AntDesign.team,
  ),
  MenuItem(null, 'Tasks', AntDesign.tool),
  MenuItem(
    null,
    'Notes',
    AntDesign.book,
  ),
];

List<MenuItem> labelItems = [
  MenuItem(
    null,
    'Family',
    null,
    color: Colors.orange,
  ),
  MenuItem(
    null,
    'Friends',
    null,
    color: Colors.purple,
  ),
  MenuItem(
    null,
    'Utilities',
    null,
    color: Colors.green,
  ),
  MenuItem(
    null,
    'Work',
    null,
    color: Colors.blue,
  ),
];

List<MenuItem> bottomMenuItems = [
  MenuItem(
    null,
    'Notifications',
    Entypo.bell,
  ),
];

class SideBar extends GetView<AppController> {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
        builder: (context) => AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: controller.isDesktop.value
                  ? sideBarDesktopWidth
                  : sideBarMobileWidth,
              decoration: BoxDecoration(
                color: darkColor,
                border: Border(
                  right: BorderSide(
                    width: .3,
                    color: darkColor.withOpacity(.2),
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 24,
                horizontal: controller.isDesktop.value ? 24 : 12,
              ),
              child: ListView(
                controller: ScrollController(),
                /*crossAxisAlignment: controller.isDesktop.value
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,*/
                children: [
                  //top item
                  Container(
                    height: 120,
                    padding: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: .3,
                          color: darkColor.withOpacity(.2),
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: controller.isDesktop.value
                              ? Alignment.topCenter
                              : Alignment.center,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: controller.isDesktop.value
                                ? MainAxisAlignment.spaceBetween
                                : MainAxisAlignment.center,
                            children: [
                              if (controller.isDesktop.value)
                                const FittedBox(
                                  child: AppLogo(),
                                ),
                              Flexible(
                                child: IconButton(
                                  onPressed: () {
                                    controller.toggleSideBar();
                                  },
                                  icon: Icon(
                                    controller.isSmall
                                        ? Ionicons.ios_arrow_forward
                                        : Ionicons.ios_arrow_back,
                                    color: textColor,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        /*WorkspaceItem(
                      isDesktop: _isDesktop,
                    ),*/
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ...topMenuItems
                      .map(
                          (e) => SideBarMenuItem(e, controller.isDesktop.value))
                      .toList(),

                  const SizedBox(
                    height: 24,
                  ),
                  MenuItemsLabelSection(isDesktop: controller.isDesktop.value),

                  const SizedBox(
                    height: 24,
                  ),
                  // Expanded(child: child),
                  ...bottomMenuItems
                      .map(
                          (e) => SideBarMenuItem(e, controller.isDesktop.value))
                      .toList(),
                ],
              ),
            ));
  }
}
