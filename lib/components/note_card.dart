import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_desktop_2/constants.dart';
import 'package:flutter_desktop_2/models/note.dart';
import 'package:flutter_desktop_2/utils/colors.dart';
import 'package:flutter_desktop_2/utils/text_styles.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:tinycolor2/tinycolor2.dart';

class NoteCard extends StatefulWidget {
  final Note note;

  const NoteCard({Key? key, required this.note}) : super(key: key);

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  double offsetY = 0.0;
  double scale = 1.0;

  late Color color;

  @override
  void initState() {
    super.initState();
    color = AppColors.random;
  }

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (e) {
          setState(() {
            offsetY = 1.22;
            scale = 1.015;
          });
        },
        onExit: (e) {
          setState(() {
            offsetY = 0.0;
            scale = 1.0;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          child: Transform.scale(
            scale: scale,
            child: Transform.translate(
              offset: Offset(0, offsetY),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: darkColor.withOpacity(.3),
                  ),
                  color: color,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.note.title,
                      style: TextStyles.secondary.apply(
                        fontWeightDelta: 5,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SingleChildScrollView(
                      child: Text(
                        widget.note.content,
                        maxLines: 5,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    // const Spacer(),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.note.postedAt,
                            style: TextStyles.secondary.apply(
                              fontSizeDelta: -2,
                            ),
                          ),
                          Container(
                            width: 32,
                            height: 32,
                            alignment: Alignment.center,
                            // padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: TinyColor(darkColor).darken().color,
                                borderRadius: BorderRadius.circular(100)),
                            child: const Icon(
                              AntDesign.edit,
                              color: backgroundColor,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
