import 'package:bag_app/responsive/res.dart';
import 'package:bag_app/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final Responsive res;
  const CategoriesWidget({super.key, required this.res});

  @override
  Widget build(BuildContext context) {
    List<String> categoryNames = [
      'Louis Vuitton',
      'Keira Milla',
      'Prada',
      'Celine',
      'Simple',
    ];

    List<String> images = [
      'assets/lv.png',
      'assets/km.png',
      'assets/prada.png',
      'assets/celine.png',
      'assets/simple.png',
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < 5; i++)
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(images[i]),
                      width: res.getWidth(120),
                      height: res.getWidth(120),
                    ),
                    returnText(
                      text: categoryNames[i],
                      color: const Color(0xFF4C53a5),
                      isHeading: true,
                      res: res,
                      size: 50,
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
