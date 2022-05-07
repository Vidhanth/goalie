import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double? width;
  final double? height;
  final Color? bgColor;
  final Color? fgColor;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.bgColor,
    this.fgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 26,
          horizontal: 8,
        ),
        primary: bgColor ?? Theme.of(context).colorScheme.secondary,
        minimumSize: Size(width ?? Get.size.width, height ?? 50),
      ),
      onPressed: () {
        onPressed.call();
      },
      child: Text(
        text,
        style: TextStyle(
          color: fgColor ?? Colors.white,
        ),
      ),
    );
  }
}
