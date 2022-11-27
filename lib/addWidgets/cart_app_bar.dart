import 'package:bag_app/responsive/res.dart';
import 'package:bag_app/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  final Responsive res;
  const CartAppBar({super.key, required this.res});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(res.getWidth(40)),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: const Color(0xFF4C53A5),
              size: res.getWidth(100),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: res.getWidth(100), right: res.getWidth(10)),
            child: returnText(
              text: 'Cart',
              color: const Color(0xff4C53A5),
              isHeading: true,
              res: res,
              size: 80,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Color(0xFF4C53A5),
            ),
          )
        ],
      ),
    );
  }
}
