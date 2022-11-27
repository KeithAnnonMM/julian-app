import 'package:bag_app/addWidgets/best_selling.dart';
import 'package:bag_app/addWidgets/categories.dart';
import 'package:bag_app/addWidgets/home_app_bar.dart';
import 'package:bag_app/models/auth.dart';
import 'package:bag_app/models/item.dart';
import 'package:bag_app/responsive/res.dart';
import 'package:bag_app/widgets/reusable_text.dart';
import 'package:bag_app/widgets/reusable_text.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  final FirebaseAuth auth;
  const Homepage({super.key, required this.auth});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int value = 2;
  final _searchController = TextEditingController();
  List<Item> cartItems = [];

  String? validate(String? searchData) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Responsive res = Responsive(context: context);
    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar(
            res: res,
            badgeValue: value.toString(),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search here ...',
                              hintStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () async {
                          await Auth(auth: widget.auth).signOutUser();
                          Get.snackbar('Alert', 'Logged out successfully');
                        },
                        child: Icon(
                          Icons.search,
                          color: const Color(0xFF4C53a5),
                          size: res.getWidth(100),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: returnText(
                    text: 'Categories',
                    color: const Color(0xFF4C53A5),
                    isHeading: true,
                    res: res,
                    size: 80,
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: CategoriesWidget(res: res)),
                Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: returnText(
                    text: 'Best Selling',
                    color: const Color(0xFF4C53A5),
                    isHeading: true,
                    res: res,
                    size: 80,
                  ),
                ),
                BestSellingItems(res: res),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: const Color(0xFF4C53A5),
        height: res.getHeight(70),
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
            size: res.getWidth(70),
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: res.getWidth(70),
          ),
          Icon(
            Icons.list_alt,
            color: Colors.white,
            size: res.getWidth(70),
          )
        ],
      ),
    );
  }
}
