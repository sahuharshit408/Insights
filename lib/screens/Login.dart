import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:insights/constants.dart';
import 'package:insights/screens/bottom_nav.dart';

import '../components/custom_button.dart';
import '../components/custom_text_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              const CustomTextFieldWidget(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: size.height * 0.024,
              ),
              const CustomTextFieldWidget(
                hintText: "Password",
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: size.height * 0.044,
              ),
              CustomButton(
                text: "Login",
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const BottomNav(),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
