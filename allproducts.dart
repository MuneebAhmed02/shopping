import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Allproducts extends StatefulWidget {
  const Allproducts({Key? key}) : super(key: key);

  @override
  _AllproductsState createState() => _AllproductsState();
}

class _AllproductsState extends State<Allproducts> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: ListView(
          children: [
            buildListItem('Modern Smart Fridge', '200', 'images/newfridge.jpg'),
            buildListItem('Iphone 13', '200', 'images/newmobile.jpg'),
            buildListItem('Tesla Model S', '200', 'images/newcar.jpg'),
            buildListItem('Adidas Hoodie', '200', 'images/newcloth.jpg'),
            buildListItem('Fresh Apples', '200', 'images/newgrocery.jpg'),
            buildListItem(
              'Samsung Smart Fridge',
              '200',
              'images/electronic1.jpg',
            ),
            buildListItem(
              'Sony Smart Fridge',
              '200',
              'images/electronic2.jpg',
            ),
            buildListItem(
              'Sony',
              '200',
              'images/electronic3.webp',
            ),
            buildListItem(
              'Samsung LED',
              '200',
              'images/electronic4.jpg',
            ),
            buildListItem(
              'Samsung Oven',
              '200',
              'images/electronic5.jpg',
            ),
            buildListItem(
              'Apple',
              '200',
              'images/mobile1.jpg',
            ),
            buildListItem(
              'Samsung',
              '200',
              'images/mobile2.png',
            ),
            buildListItem(
              'Realme',
              '200',
              'images/mobile3.png',
            ),
            buildListItem(
              'Vivo',
              '200',
              'images/mobile4.jpg',
            ),
            buildListItem(
              'Oppo',
              '200',
              'images/mobile5.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(String name, String price, String image) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // ignore: sized_box_for_whitespace
          Container(
            width: 220,
            child: Row(
              children: [
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Colors.blueGrey.shade800,
                  ),
                  child: Center(
                    child: Image.asset(image, height: 50.0, width: 50.0),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // ignore: prefer_const_literals_to_create_immutables
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '\$' + price,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFF68D7F),
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            width: 4.0,
                          ),
                          // ignore: prefer_adjacent_string_concatenation
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            // ignore: prefer_adjacent_string_concatenation
                            child: Text('\$' + '20',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    // decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.withOpacity(0.4))),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              // submitFav();
              User? firebaseUser = FirebaseAuth.instance.currentUser;
              if (firebaseUser != null) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(
                        // ignore: unnecessary_brace_in_string_interps
                        content: Text('User is logged in'),
                      );
                    });
              } else {
                // ignore: avoid_print
                print('error');
                Navigator.of(context).pushNamed('/login');
              }
            },
            heroTag: name,
            mini: true,
            // ignore: prefer_const_constructors
            child: Center(
                // ignore: prefer_const_constructors
                child: Icon(Icons.favorite, color: Colors.white)),

            backgroundColor: Colors.deepOrange,
          ),
          FloatingActionButton(
            onPressed: () {
              // submitCart();
              User? firebaseUser = FirebaseAuth.instance.currentUser;
              if (firebaseUser != null) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(
                        // ignore: unnecessary_brace_in_string_interps
                        content: Text('User is logged in'),
                      );
                    });
              } else {
                // ignore: avoid_print
                print('error');
                Navigator.of(context).pushNamed('/login');
              }
            },
            heroTag: name,
            mini: true,
            // ignore: prefer_const_constructors
            child: Center(
                // ignore: prefer_const_constructors
                child: Icon(Icons.add, color: Colors.white)),

            backgroundColor: Colors.deepOrange,
          )
        ],
      ),
    );
  }
}
