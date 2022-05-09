// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:goalie/components/button.dart';
import 'package:goalie/components/color_picker.dart';

class AddSheet extends StatelessWidget {
  final String title;
  final Function(String, int) onSubmit;
  int selectedIndex;

  final TextEditingController _controller = TextEditingController();

  AddSheet({
    Key? key,
    required this.title,
    required this.onSubmit,
    this.selectedIndex = 0,
  }) : super(key: key);

  submit(String value) async {
    await onSubmit.call(
      value,
      selectedIndex,
    );
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
              autofocus: true,
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
            StatefulBuilder(builder: (context, setState) {
              return ColorPicker(
                onColorSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                selectedIndex: selectedIndex,
              );
            }),
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
