import 'package:flutter/material.dart';
import 'package:goalie/res/decor.dart';

class ColorPicker extends StatelessWidget {
  final Function onColorSelected;
  final int selectedIndex;

  const ColorPicker(
      {Key? key, required this.onColorSelected, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          scrollDirection: Axis.horizontal,
          children: List.generate(
            colorsList.length,
            (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                decoration: BoxDecoration(
                  color: colorsList[index],
                  shape: BoxShape.circle,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: splashColor,
                    hoverColor: highlightColor,
                    focusColor: focusColor,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      onColorSelected.call(index);
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: index == selectedIndex
                          ? Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                color: splashColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check_rounded,
                                color: Colors.black45,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
