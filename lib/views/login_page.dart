import 'package:bag_app/main.dart';
import 'package:bag_app/models/auth.dart';
import 'package:bag_app/responsive/res.dart';
import 'package:bag_app/widgets/reusable_text.dart';
import 'package:bag_app/widgets/reusable_textformfield.dart';
import 'package:bag_app/widgets/submit_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  final FirebaseAuth auth;
  const Login({super.key, required this.auth});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isPassword = true;

  void isPasswordType() {
    setState(() {
      isPassword = !isPassword;
    });
  }

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) return 'Email can not be empty';
    String pattern = r'\w+@\w+\.\w+';
    RegExp reg = RegExp(pattern);
    if (!reg.hasMatch(formEmail)) return 'Invalid Email format';

    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return 'Password can not be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Responsive res = Responsive(context: context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.fromLTRB(res.getWidth(100), res.getWidth(300),
            res.getWidth(100), res.getWidth(400)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: res.getWidth(10),
                    right: res.getWidth(10),
                    top: res.getHeight(150)),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF4C53A5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(res.getWidth(70)),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        SizedBox(height: res.getHeight(30)),
                        reusableTextField(
                            'Email Address',
                            _emailController,
                            false,
                            const Icon(Icons.person, color: Colors.white),
                            validateEmail,
                            res),
                        const SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.only(right: res.getWidth(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: isPasswordType,
                                child: returnText(
                                    text: isPassword
                                        ? 'Show Password'
                                        : 'Hide Password',
                                    color: Colors.white,
                                    isHeading: false,
                                    res: res,
                                    size: res.getWidth(170)),
                              ),
                            ],
                          ),
                        ),
                        reusableTextField(
                            'Password',
                            _passwordController,
                            isPassword,
                            const Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            validatePassword,
                            res),
                        const SizedBox(height: 20),
                        signInsignUp(context, res, 'LOGIN', () async {
                          if (_key.currentState!.validate()) {
                            String result =
                                await Auth(auth: widget.auth).signInUser(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            if (result == 'Success') {
                              Get.snackbar('Alert', 'Logged in successfully');
                            } else {
                              Get.snackbar('ALERT', result);
                            }
                          }
                        }, false),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () async {
                            if (_key.currentState!.validate()) {
                              String message =
                                  await Auth(auth: widget.auth).createAccount(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                              if (message == 'Success') {
                                Get.snackbar(
                                    'Alert', 'Account Created successfully');
                              } else {
                                Get.snackbar('Alert', message);
                              }
                            }
                          },
                          child: const Text(
                            'Create New Account',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 80),
                        const Text(
                          'Coded By Keith Jason',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
