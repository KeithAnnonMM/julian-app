import 'package:bag_app/addWidgets/cart_app_bar.dart';
import 'package:bag_app/addWidgets/cart_item_samples.dart';
import 'package:bag_app/responsive/res.dart';
import 'package:flutter/material.dart';

class CartItemsPage extends StatefulWidget {
  const CartItemsPage({super.key});

  @override
  State<CartItemsPage> createState() => _CartItemsPageState();
}

class _CartItemsPageState extends State<CartItemsPage> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    Responsive res = Responsive(context: context);
    data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
        body: ListView(
      children: [
        CartAppBar(res: res),
        Container(
          height: 700,
          decoration: const BoxDecoration(
            color: Color(0xFFEDECF2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          child: Column(
            children: [
              for (int i = 0; i < data['cartList'].length; i++)
                CartItemSamples(
                  res: res,
                  name: data['cartList'][i].name,
                  price: data['cartList'][i].price,
                  image: data['cartList'][i].image,
                )
            ],
          ),
        )
      ],
    ));
  }
}
