import 'package:flutter/material.dart';
import 'package:shopping/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final bool _hidden = true;
    final TextEditingController firstname = TextEditingController();
    final TextEditingController lastname = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController cpassword = TextEditingController();
    void register() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      // ignore: non_constant_identifier_names
      final String Fname = firstname.text;
      // ignore: non_constant_identifier_names
      final String Lname = lastname.text;
      // ignore: non_constant_identifier_names
      final String Email = email.text;
      // ignore: non_constant_identifier_names
      final String Password = password.text;
      // ignore: non_constant_identifier_names, unused_local_variable
      final String CPassword = cpassword.text;
      try {
        final UserCredential user = await auth.createUserWithEmailAndPassword(
            email: Email, password: Password);
        await db
            .collection('user')
            .doc(user.user!.uid)
            .set({"firstname": Fname, "lastname": Lname});

        // ignore: avoid_print
        print('User is created');
        Navigator.of(context).pushNamed(
          "/login",
        );
      } catch (e) {
        // ignore: avoid_print
        print('error');
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: const Text('Signup Page'),
          toolbarHeight: 67,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    controller: firstname,
                    decoration: InputDecoration(
                      labelText: "Enter your first name",
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
                    controller: lastname,
                    decoration: InputDecoration(
                      labelText: "Enter your last name",
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
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    controller: cpassword,
                    obscureText: _hidden,
                    decoration: InputDecoration(
                      labelText: "confirm password",
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
                      register();
                    },
                    height: 50,
                    color: Colors.redAccent,
                    child: const Text('Register',
                        style: TextStyle(color: Colors.white))),
                const SizedBox(
                  height: 13,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Already have an account?',
                      style: TextStyle(fontSize: 15.0)),
                  const SizedBox(
                    height: 13,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            // ignore: prefer_const_constructors
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: const Text('Login here',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15.0,
                            decoration: TextDecoration.underline,
                          ))),
                ]),
              ],
            ),
          ),
        ));
  }
}
