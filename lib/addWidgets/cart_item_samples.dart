import 'package:bag_app/responsive/res.dart';
import 'package:bag_app/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

class CartItemSamples extends StatefulWidget {
  final Responsive res;
  final String image;
  final String name;
  final String price;
  const CartItemSamples(
      {super.key,
      required this.res,
      required this.image,
      required this.name,
      required this.price});

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(widget.res.getWidth(10)),
        margin: EdgeInsets.all(widget.res.getWidth(10)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(children: [
          Row(
            children: [
              Image(
                image: AssetImage(widget.image),
                height: widget.res.getHeight(100),
                width: widget.res.getWidth(100),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: widget.res.getWidth(10),
                    right: widget.res.getWidth(10)),
                child: Column(
                  children: [
                    returnText(
                      text: widget.name,
                      color: const Color(0xFF4C53A5),
                      isHeading: true,
                      res: widget.res,
                      size: 50,
                    ),
                    returnText(
                      text: widget.price,
                      color: const Color(0xFF4C53A5),
                      isHeading: false,
                      res: widget.res,
                      size: 50,
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
              )
            ],
          )
        ]),
      ),
    );
  }
}
