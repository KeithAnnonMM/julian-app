import 'package:bag_app/models/auth.dart';
import 'package:bag_app/views/homepage.dart';
import 'package:bag_app/views/loading.dart';
import 'package:bag_app/views/login_page.dart';
import 'package:bag_app/views/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Julian\'s App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: _initialization,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const WelcomePage();
            }

            if (snapshot.hasError) {
              return const Scaffold(
                  body: Center(child: Text('An error Occurred')));
            }
            return const Loading();
          })),
    );
  }
}

class Root extends StatelessWidget {
  Root({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth(auth: _auth).user,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data?.uid == null) {
              return Login(auth: _auth);
            } else {
              return Homepage(auth: _auth);
            }
          }
          return const Loading();
        }));
  }
}
