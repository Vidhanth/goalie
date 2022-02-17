import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
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
        primary: Theme.of(context).colorScheme.secondary,
        minimumSize: Size(Get.size.width, 50),
      ),
      onPressed: () {
        onPressed.call();
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
