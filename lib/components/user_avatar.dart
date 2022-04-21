import 'package:flutter/material.dart';
import 'package:flutter_desktop_2/constants.dart';
import 'package:flutter_desktop_2/utils/avatar_gen.dart';
import 'package:flutter_svg/svg.dart';

class UserAvatar extends StatelessWidget {
  final double? size;

  const UserAvatar({
    Key? key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CircleAvatar(
        backgroundColor: backgroundColor,
        radius: size,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SvgPicture.network(
            "${AvatarGen.apiUrl}profile.svg",
            width: size ?? 12,
            height: size ?? 12,
          ),
        ),
      );

  Widget buildAvatar(String asset) => ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: CircleAvatar(
          backgroundColor: darkColor,
          radius: 18,
          child: Image.asset(
            "assets/images/$asset",
            fit: BoxFit.cover,
            width: size ?? 20,
            height: size ?? 20,
          ),
        ),
      );
}
