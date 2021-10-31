import 'package:flutter/material.dart';

class Clothes extends StatefulWidget {
  const Clothes({Key? key}) : super(key: key);

  @override
  _ClothesState createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildListItem(
            'Hoodies',
            '200',
            'images/cloth1.jpg',
          ),
          buildListItem(
            'Jakcets',
            '200',
            'images/cloth2.jpg',
          ),
          buildListItem(
            '3 Piece Suit',
            '200',
            'images/cloth3.jpg',
          ),
          buildListItem(
            'Bear Jacket',
            '200',
            'images/cloth4.webp',
          ),
          buildListItem(
            'Gloves',
            '200',
            'images/cloth5.jpg',
          ),
        ],
      ),
    );
  }

  Widget buildListItem(String name, String price, String imgpath) {
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
                    child: Image.asset(imgpath, height: 50.0, width: 50.0),
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
            onPressed: () {},
            heroTag: name,
            mini: true,
            // ignore: prefer_const_constructors
            child: Center(
                // ignore: prefer_const_constructors
                child: Icon(Icons.favorite, color: Colors.white)),

            backgroundColor: Colors.blueGrey.shade800,
          ),
          FloatingActionButton(
            onPressed: () {},
            heroTag: name,
            mini: true,
            // ignore: prefer_const_constructors
            child: Center(
                // ignore: prefer_const_constructors
                child: Icon(Icons.add, color: Colors.white)),

            backgroundColor: Colors.blueGrey.shade800,
          )
        ],
      ),
    );
  }
}
