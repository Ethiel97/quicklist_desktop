import 'package:flutter/material.dart';

class MenuItem {
  final String? image;
  final String label;
  final IconData? icon;
  final Color? color;

  final Widget? trailing;

  MenuItem(
    this.image,
    this.label,
    this.icon, {
    this.color,
    this.trailing,
  });
}
