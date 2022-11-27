import 'package:badges/badges.dart';
import 'package:bag_app/responsive/res.dart';
import 'package:bag_app/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final Responsive res;
  final String badgeValue;
  const HomeAppBar({super.key, required this.res, required this.badgeValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(res.getWidth(40)),
      child: Row(
        children: [
          Icon(
            Icons.sort,
            color: const Color(0xFF4C53A5),
            size: res.getWidth(120),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: res.getWidth(100), right: res.getWidth(10)),
            child: returnText(
              text: 'Julian\'s HandBags',
              color: const Color(0xff4C53A5),
              isHeading: true,
              res: res,
              size: 80,
            ),
          ),
          const Spacer(),
          Badge(
            badgeColor: int.parse(badgeValue) == 0 ? Colors.white : Colors.red,
            padding: const EdgeInsets.all(8),
            badgeContent: returnText(
              text: badgeValue,
              color: Colors.white,
              isHeading: false,
              res: res,
              size: 50,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              icon: Icon(
                Icons.shopping_bag_rounded,
                size: res.getWidth(100),
                color: const Color(0xFF4C53A5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
