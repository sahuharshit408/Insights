import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insights/auth.dart';
import 'package:insights/components/custom_button.dart';
import 'package:insights/components/custom_text_field_widget.dart';
import 'package:insights/constants.dart';
import 'package:insights/screens/Login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late TapGestureRecognizer _gestureRecognizer;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _gestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: LoginPageBG,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.030),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.084,
                ),
                SizedBox(
                  height: 158,
                  width: 177,
                  child: Image.asset(
                    img1,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.084,
                ),
                const Text(
                  "Welcome !",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontVariations: [
                      FontVariation(
                        'wght',
                        700,
                      ),
                    ],
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.028,
                ),
                const Text(
                  "Please Signup with your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontVariations: [
                      FontVariation(
                        'wght',
                        400,
                      ),
                    ],
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.038,
                ),
                CustomTextFieldWidget(
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                SizedBox(
                  height: size.height * 0.024,
                ),
                CustomTextFieldWidget(
                  hintText: "Password",
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                ),
                SizedBox(
                  height: size.height * 0.044,
                ),
                CustomButton(
                  text: "Signup",
                  onPressed: () async {
                    Auth().registerWithEmailAndPassword(
                        emailController.text, passwordController.text);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage()
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Already Registered Go Back to ',
                    style: const TextStyle(
                      fontVariations: [
                        FontVariation(
                          'wght',
                          400,
                        ),
                      ],
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Login',
                        recognizer: _gestureRecognizer,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
