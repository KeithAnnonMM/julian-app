import 'package:bag_app/models/item.dart';
import 'package:bag_app/responsive/res.dart';
import 'package:bag_app/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

class BestSellingItems extends StatefulWidget {
  final Responsive res;
  const BestSellingItems({super.key, required this.res});

  @override
  State<BestSellingItems> createState() => _BestSellingItemsState();
}

class _BestSellingItemsState extends State<BestSellingItems> {
  List<bool> isFav = [false, false, false, false, false, false, false];

  List<Item> items = [
    Item(
        name: 'Louis Vuitton',
        image: 'assets/lv.png',
        discount: '-20%',
        price: '\$54'),
    Item(
        name: 'Keira Milla',
        image: 'assets/km.png',
        discount: '-15%',
        price: '\$45'),
    Item(
        name: 'Prada',
        image: 'assets/prada.png',
        discount: '-50%',
        price: '\$50'),
    Item(
        name: 'Gucci',
        image: 'assets/gucci.png',
        discount: '-5%',
        price: '\$34'),
    Item(
        name: 'Portable',
        image: 'assets/port.png',
        discount: '-10%',
        price: '\$22'),
    Item(
        name: 'Simple',
        image: 'assets/simple.png',
        discount: '-25%',
        price: '\$21'),
    Item(
        name: 'Italian',
        image: 'assets/italia.png',
        discount: '-12%',
        price: '\$14')
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.67,
      children: [
        for (int i = 0; i < items.length; i++)
          Container(
            padding: EdgeInsets.only(
                left: widget.res.getWidth(25),
                right: widget.res.getWidth(25),
                top: widget.res.getHeight(20)),
            margin: EdgeInsets.symmetric(
              vertical: widget.res.getHeight(10),
              horizontal: widget.res.getWidth(50),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(widget.res.getWidth(10)),
                      margin: EdgeInsets.only(left: widget.res.getWidth(20)),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4C53A5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: returnText(
                          text: items[i].discount,
                          color: Colors.white,
                          isHeading: false,
                          res: widget.res,
                          size: 40),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isFav[i] = !isFav[i];
                        });
                      },
                      icon: Icon(
                        isFav[i]
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_outlined,
                        color: isFav[i] ? Colors.red : const Color(0xFF4C53a5),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: widget.res.getWidth(20)),
                  child: Image.asset(
                    items[i].image,
                    height: widget.res.getHeight(170),
                    width: widget.res.getHeight(170),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      EdgeInsets.symmetric(horizontal: widget.res.getWidth(20)),
                  child: returnText(
                    text: items[i].name,
                    color: const Color(0xFF4C53A5),
                    isHeading: true,
                    res: widget.res,
                    size: 50,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      EdgeInsets.symmetric(horizontal: widget.res.getWidth(20)),
                  child: returnText(
                    text:
                        'For you best ${items[i].name} Products. Shop with us',
                    color: const Color(0xFF4C53A5),
                    isHeading: false,
                    res: widget.res,
                    size: 30,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(
                          horizontal: widget.res.getWidth(20)),
                      child: returnText(
                        text: items[i].price,
                        color: const Color(0xFF4C53A5),
                        isHeading: true,
                        res: widget.res,
                        size: 50,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart_checkout,
                        color: Color(0xFF4C53a5),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
      ],
    );
  }
}
