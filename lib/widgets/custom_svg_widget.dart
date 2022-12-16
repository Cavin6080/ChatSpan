import 'package:chat_app/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgWidget extends StatelessWidget {
  final String path;
  final Color color;
  final double height;
  const CustomSvgWidget(
      {Key? key,
      required this.path,
      this.color = StyleConstants.primaryColor,
      this.height = 25})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      color: color,
      height: height,
    );
  }
}
