import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:insights/Providers/pr_provider.dart';
import 'package:insights/auth.dart';
import 'package:insights/firebase_options.dart';
import 'package:insights/screens/Login.dart';
import 'package:insights/screens/bottom_nav.dart';
import 'package:insights/utils/preference_utlis.dart';
import 'package:provider/provider.dart';

final _auth = FirebaseAuth.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final fcmToken = await messaging.getToken();
  print("FCM TOKEN : $fcmToken");

  await init();
  await setString("fcmToken", fcmToken ?? "");
  runApp(
    ChangeNotifierProvider(
      create: (context) => PrPovider(), // Create an instance of your data model
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Widget? w = const Center(child: CircularProgressIndicator());

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    try {
      final isLoggedIn = await Auth().isLoggedIn();
      if (isLoggedIn) {
        setState(() {
          w = const BottomNav();
        });
      } else {
        setState(() {
          w = const LoginPage();
        });
      }
    } catch (e) {
      w = const LoginPage();
      setState(() {});
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: w
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
