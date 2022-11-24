import 'package:flutter/material.dart';
import 'package:bag_app/responsive/res.dart';
import 'package:bag_app/widgets/reusable_text.dart';

Container dashButton(
    {required String text,
    required IconData icon,
    required Color color,
    required Responsive res,
    required bool isSelected,
    required bool isDash}) {
  return Container(
    height: res.getHeight(58),
    color: isSelected
        ? const Color.fromARGB(255, 14, 14, 48)
        : const Color(0xFF12113C),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon,
            color: color, size: isDash ? res.getWidth(30) : res.getWidth(18)),
        SizedBox(width: res.getWidth(15)),
        returnText(
            text: text,
            color: Colors.white,
            isHeading: false,
            res: res,
            size: 16),
      ],
    ),
  );
}
