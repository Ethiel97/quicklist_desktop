import 'package:flutter/material.dart';
import 'package:flutter_desktop_2/models/menu_item.dart';

import '../constants.dart';

class SideBarMenuItem extends StatefulWidget {
  final MenuItem menuItem;
  final bool isDesktop;

  const SideBarMenuItem(this.menuItem, [this.isDesktop = false, Key? key])
      : super(key: key);

  @override
  State<SideBarMenuItem> createState() => _SideBarMenuItemState();
}

class _SideBarMenuItemState extends State<SideBarMenuItem> {
  var _bgColor = Colors.transparent;
  double leftPadding = 0;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          // _menuItemProvider.setItem(widget.menuItem);
        },
        child: MouseRegion(
          onHover: (e) {
            setState(() {
              _bgColor = backgroundColor.withOpacity(.09);
              leftPadding = 8;
            });
          },
          onExit: (e) {
            setState(() {
              _bgColor = Colors.transparent;
              leftPadding = 0;
            });
          },
          child: AnimatedContainer(
            alignment: Alignment.centerLeft,
            duration: const Duration(milliseconds: 120),
            width: widget.isDesktop ? 180 : 45,
            height: 36,
            padding: EdgeInsets.only(
              left: leftPadding,
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: _bgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: widget.isDesktop
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                ...[
                  Icon(
                    widget.menuItem.icon,
                    size: 17,
                    color: Colors.white,
                  ),
                ],
                if (widget.isDesktop) ...[
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      widget.menuItem.label,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: widget.menuItem.image != null
                            ? FontWeight.w400
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    child: widget.menuItem.trailing,
                  ),
                ] else
                  const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      );
}
