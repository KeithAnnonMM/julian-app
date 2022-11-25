import 'package:bag_app/models/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  final FirebaseAuth auth;
  const Homepage({super.key, required this.auth});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () async {
            await Auth(auth: widget.auth).signOutUser();
          },
          child: const Text('Home Page'),
        ),
      ),
    );
  }
}
