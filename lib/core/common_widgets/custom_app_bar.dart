import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.titleStyle,
    this.automaticallyImplyLeading = false,
    this.centerTitle = false,
    this.backgroundColor,
    this.leading,
    this.leadingWidth,
    this.actions,
  });
  final String title;
  final TextStyle? titleStyle;
  final bool automaticallyImplyLeading;
  final bool? centerTitle;
  final Color? backgroundColor;
  final Widget? leading;
  final double? leadingWidth;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: titleStyle),
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: centerTitle,
      scrolledUnderElevation: 0,
      backgroundColor: backgroundColor,
      leading: leading,
      leadingWidth: leadingWidth,
      actions: actions,
      titleSpacing: 0,
    );
  }
}
