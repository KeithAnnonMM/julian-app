import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bag_app/responsive/res.dart';

TextFormField reusableTextField(String text, TextEditingController controller,
    bool isPasswordType, Icon prefixIcon, validate, Responsive res) {
  return TextFormField(
    controller: controller,
    validator: validate,
    obscureText: isPasswordType,
    style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.9)),
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    decoration: InputDecoration(
      label: Text(text),
      labelStyle: GoogleFonts.poppins(
          fontSize: res.getWidth(50), color: Colors.white.withOpacity(0.9)),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
      prefixIcon: prefixIcon,
    ),
    keyboardType:
        isPasswordType ? TextInputType.visiblePassword : TextInputType.text,
  );
}
