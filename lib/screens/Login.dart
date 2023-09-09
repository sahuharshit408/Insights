import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insights/auth.dart';
import 'package:insights/constants.dart';
import 'package:insights/screens/bottom_nav.dart';
import 'package:insights/screens/signup.dart';
import '../components/custom_button.dart';
import '../components/custom_text_field_widget.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TapGestureRecognizer? _gestureRecognizer;
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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SignUp(),
          ),
        );
      };
    super.initState();
  }

  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    setState(
      () {
        if (user != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const BottomNav(),
            ),
          );
        }
      },
    );
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
                  "Please Log into your account",
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
                  text: "Login",
                  onPressed: () async {
                    Auth().signInWithEmailAndPassword(
                      context: context,
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
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
                        text: ' Signup',
                        recognizer: _gestureRecognizer,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                IconButton(
                  onPressed: () async {
                    await Auth().signInWithGoogle(context: context);
                  },
                  icon: SvgPicture.asset(
                    'assets/icons8-google.svg',
                    width: 30,
                    height: 30,
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
