import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopping/newarrivals.dart';
import 'package:shopping/policies.dart';

import 'package:shopping/signupup.dart';

import 'about.dart';
import 'cart.dart';
import 'favorite.dart';
import 'homeScreen.dart';
import 'login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => HomeScreen(),
              '/login': (context) => const Login(),
              '/signup': (context) => const Signup(),
              '/cart': (context) => const Cart(),
              '/fav': (context) => const Favorite(),
              '/about': (context) => const About(),
              '/policies': (context) => const Policies(),
              '/new': (context) => NewArrivals()
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    );
  }
}
