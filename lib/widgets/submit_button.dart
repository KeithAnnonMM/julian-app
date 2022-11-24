import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bag_app/responsive/res.dart';

Container signInsignUp(
    BuildContext context, Responsive res, String text, Function ontap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: res.getHeight(70),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
        onPressed: () {
          ontap();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black;
              }
              return Colors.white;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: res.getWidth(60)),
        )),
  );
}
