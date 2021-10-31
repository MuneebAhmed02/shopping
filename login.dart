import 'package:flutter/material.dart';
import 'package:shopping/signupup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'homeScreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final bool _hidden = true;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  void loginhere() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;
    // ignore: non_constant_identifier_names
    final String Email = email.text;
    // ignore: non_constant_identifier_names
    final String Password = password.text;

    try {
      final UserCredential user = await auth.signInWithEmailAndPassword(
          email: Email, password: Password);
      final DocumentSnapshot snapshot =
          await db.collection('user').doc(user.user!.uid).get();

      // ignore: unused_local_variable
      final data = snapshot.data();
      Navigator.of(context).pushNamed(
        "/",
      );
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              // ignore: unnecessary_brace_in_string_interps
              content: Text('${e}'),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        toolbarHeight: 67,
        title: const Text('Login Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Enter your email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextFormField(
                  controller: password,
                  obscureText: _hidden,
                  decoration: InputDecoration(
                    labelText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              // ignore: deprecated_member_use
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      side: const BorderSide(color: Colors.white)),
                  onPressed: () {
                    loginhere();
                  },
                  height: 50,
                  color: Colors.redAccent,
                  child: const Text('Login',
                      style: TextStyle(color: Colors.white))),
              const SizedBox(
                height: 13,
              ),
              const Text('or', style: TextStyle(fontSize: 20.0)),
              const SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?',
                      style: TextStyle(fontSize: 15.0)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signup()));
                      },
                      child: const Text('Register Here',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                              fontSize: 15.0))),
                ],
              ),
              // ignore: deprecated_member_use
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      side: const BorderSide(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  height: 50,
                  color: Colors.redAccent,
                  child: const Text('Continue as guest',
                      style: TextStyle(color: Colors.white))),
              const SizedBox(
                height: 13,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
