import 'package:flutter/material.dart';
import 'package:flutter_desktop_2/constants.dart';
import 'package:flutter_desktop_2/utils/text_styles.dart';

class SideBarLabelItem extends StatefulWidget {
  const SideBarLabelItem(
      {Key? key,
      required this.color,
      required this.label,
      required this.isDesktop})
      : super(key: key);

  final Color color;
  final String label;
  final bool isDesktop;

  @override
  State<SideBarLabelItem> createState() => _SideBarLabelItemState();
}

class _SideBarLabelItemState extends State<SideBarLabelItem> {
  double leftPadding = 0.0;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: MouseRegion(
          onHover: (e) {
            setState(() {
              leftPadding = 8.0;
            });
          },
          onExit: (e) {
            setState(() {
              leftPadding = 0.0;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            padding: EdgeInsets.only(left: leftPadding),
            child: Row(
              mainAxisAlignment: widget.isDesktop
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: widget.color,
                  radius: 4,
                ),
                if (widget.isDesktop) ...[
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    widget.label,
                    style: TextStyles.secondary.apply(
                      fontSizeDelta: -1,
                      color: textColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
}
