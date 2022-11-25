import 'package:bag_app/main.dart';
import 'package:bag_app/responsive/res.dart';
import 'package:bag_app/views/login_page.dart';
import 'package:bag_app/widgets/reusable_text.dart';
import 'package:bag_app/widgets/submit_button.dart';

import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Responsive res = Responsive(context: context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(res.getWidth(30), res.getHeight(50),
              res.getWidth(30), res.getHeight(10)),
          child: Column(
            children: [
              SizedBox(height: res.getHeight(180)),
              Image(
                image: const AssetImage('assets/r.png'),
                width: res.getWidth(1000),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: res.getWidth(30), right: res.getWidth(30)),
                child: returnText(
                  text: "Great Way to Lift\nUp your Lifestyle",
                  color: Colors.white,
                  isHeading: true,
                  res: res,
                  size: 180,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: res.getWidth(30), right: res.getWidth(30)),
                child: returnText(
                  text:
                      "Step up your fashion game with Julian's HandBags\nFor your best bag solutions with the best pricing..",
                  color: Colors.grey,
                  isHeading: true,
                  res: res,
                  size: 60,
                ),
              ),
              SizedBox(height: res.getHeight(30)),
              Padding(
                padding: EdgeInsets.only(
                    left: res.getWidth(30), right: res.getWidth(30)),
                child: signInsignUp(context, res, 'Get Started', () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Root()));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
