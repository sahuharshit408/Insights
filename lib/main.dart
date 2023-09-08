import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insights/firebase_options.dart';
import 'package:insights/screens/Login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage()
      // BottomNav() add to sign up button on press
      ,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Raleway",
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
