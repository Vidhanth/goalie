import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:goalie/components/button.dart';

class Sheet extends StatelessWidget {
  final String title;
  final Function(String) onSubmit;

  final TextEditingController _controller = TextEditingController();

  Sheet({
    Key? key,
    required this.title,
    required this.onSubmit,
  }) : super(key: key);

  submit(String value) async {
    if (value.isNotEmpty) {
      await onSubmit.call(value);
    }
    Get.back();
  }

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
            TextField(
              controller: _controller,
              onSubmitted: (value) {
                submit(value.trim());
              },
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                fillColor:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.10),
                filled: true,
                hintText: title,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Button(
              text: 'Done',
              onPressed: () {
                submit(_controller.text.trim());
              },
            )
          ],
        ),
      ),
    );
  }
}
