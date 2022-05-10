// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:goalie/components/button.dart';
import 'package:goalie/components/color_picker.dart';
import 'package:goalie/res/strings.dart';

class AddSheet extends StatelessWidget {
  final String hint, initialText;
  final Function(String, int) onSubmit;
  int selectedIndex;

  final TextEditingController _controller = TextEditingController();

  AddSheet({
    Key? key,
    required this.hint,
    required this.onSubmit,
    this.initialText = "",
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
    if (_controller.text.isEmpty && initialText.isNotEmpty) {
      _controller.text = initialText;
    }
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      margin: EdgeInsets.zero,
      child: SingleChildScrollView(
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
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                fillColor:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.10),
                filled: true,
                hintText: hint,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
              height: 10,
            ),
            Button(
              text: doneText,
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
