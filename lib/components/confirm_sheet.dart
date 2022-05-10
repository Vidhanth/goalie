import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:goalie/components/button.dart';
import 'package:goalie/res/strings.dart';

class ConfirmSheet extends StatelessWidget {
  final String title, message;

  const ConfirmSheet({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              message,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Button(
                    width: 10,
                    bgColor: Colors.red,
                    text: dialogPositiveText,
                    onPressed: () {
                      Get.back(result: true);
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Button(
                    width: 10,
                    text: dialogNegativeText,
                    onPressed: () {
                      Get.back(result: false);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
