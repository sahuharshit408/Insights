import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights/models/constants.dart';
import 'package:insights/screens/bottom_nav.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
              Image.asset(img1),
              SizedBox(
                height: size.height * 0.084,
              ),
              const Text(
                "Welcome !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
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
                  fontWeight: FontWeight.normal,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: size.height * 0.038,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white70 , fontSize: 22),
                decoration: InputDecoration(
                  focusedBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: primaryColor
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                  filled: true,
                  hintText: "Email",
                  hintStyle: const TextStyle(fontSize: 22, color: Colors.grey),
                  labelStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(userIcon),
                  ),
                  fillColor: LoginPageBG,
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.024,
              ),
              TextField(
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white70 , fontSize: 22),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1,
                          color: primaryColor
                      ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                  filled: true,
                  hintText: "Password",
                  hintStyle: const TextStyle(fontSize: 22, color: Colors.grey),
                  labelStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(userIcon),
                  ),
                  fillColor: LoginPageBG,
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.044,
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: size.height * 0.060,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 32),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const BottomNav(),
                    ),
                  );
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
