import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';

import '../constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: darkColor.withOpacity(.06),
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: const Align(
          alignment: Alignment.center,
          child: TextField(
            cursorColor: textColor,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search notes',
              alignLabelWithHint: true,
              prefixIcon: Icon(
                AntDesign.search1,
                size: 18,
                color: textColor,
              ),
            ),
          ),
        ),
      );
}
