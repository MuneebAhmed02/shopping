// ignore: file_names
import 'package:flutter/material.dart';
import 'package:shopping/electronics.dart';
import 'package:shopping/car.dart';
import 'package:shopping/clothes.dart';
import 'package:shopping/mobiles.dart';
import 'package:shopping/groceries.dart';
import 'package:shopping/signupup.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';
import 'newarrivals.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  // late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 6);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  // Icon icon = const Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
          toolbarHeight: 67,
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          actions: [
            IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: dataSearch());
                  // print('print');
                }),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/cart');
                },
                icon: const Icon(Icons.shopping_cart)),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Stack(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Positioned(
                        bottom: 12.0,
                        left: 16.0,
                        child: const Text(
                          'Ali',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage('images/bg.jpg'))),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 2.0,
                shadowColor: Colors.redAccent,
                child: ListTile(
                  title: const Text('Favorites'),
                  onTap: () {
                    Navigator.of(context).pushNamed('/fav');
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 2.0,
                shadowColor: Colors.redAccent,
                child: ListTile(
                  title: const Text('Previous Orders'),
                  onTap: () {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 2.0,
                shadowColor: Colors.redAccent,
                child: ListTile(
                  title: const Text('Edit Address'),
                  onTap: () {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 2.0,
                shadowColor: Colors.redAccent,
                child: ListTile(
                  title: const Text('About'),
                  onTap: () {
                    Navigator.of(context).pushNamed('/about');
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 2.0,
                shadowColor: Colors.redAccent,
                child: ListTile(
                  title: const Text('Policies'),
                  onTap: () {
                    Navigator.of(context).pushNamed('/policies');
                  },
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
              ),
              Card(
                elevation: 2.0,
                shadowColor: Colors.redAccent,
                child: ListTile(
                  title: const Text('Login'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 2.0,
                shadowColor: Colors.redAccent,
                child: ListTile(
                  title: const Text('Signup'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Signup()));
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 2.0,
                shadowColor: Colors.redAccent,
                child: ListTile(
                  title: const Text('Signout'),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                ),
              ),
            ],
          ),
          elevation: 2.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildListItem("Electronics", 'images/electronics.jpg',
                        '100', Colors.blueGrey.shade800, Colors.white),
                    buildListItem("Mobiles", 'images/mobile.jpg', '100',
                        Colors.blueGrey.shade800, Colors.white),
                    buildListItem("Cars", 'images/car.png', '100',
                        Colors.blueGrey.shade800, Colors.white),
                    buildListItem("Clothes", 'images/cloth.jpg', '100',
                        Colors.blueGrey.shade800, Colors.white),
                    buildListItem("Groceries", 'images/grocery.jpg', '100',
                        Colors.blueGrey.shade800, Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 25.0),
              Padding(
                  padding: const EdgeInsets.all(9),
                  child: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey.withOpacity(0.5),
                    labelStyle: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: const TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.bold),
                    // ignore: prefer_const_literals_to_create_immutables
                    tabs: [
                      const Tab(
                        child: Text('New Arrivals'),
                      ),
                      const Tab(
                        child: Text('Electronics'),
                      ),
                      const Tab(
                        child: Text('Mobiles'),
                      ),
                      const Tab(
                        child: Text('Cars'),
                      ),
                      const Tab(
                        child: Text('Clothes'),
                      ),
                      const Tab(
                        child: Text('Groceries'),
                      ),
                    ],
                  )),
              // ignore: sized_box_for_whitespace
              Container(
                height: MediaQuery.of(context).size.height - 450,
                child: TabBarView(
                  controller: tabController,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    NewArrivals(),
                    const Electronics(),
                    const Mobiles(),
                    const Car(),
                    const Clothes(),
                    const Groceries()
                    // const One(),
                    // const One(),
                    // const One(),
                    // const One(),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget buildListItem(String name, String imgpth, String price, Color bgcolor,
      Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          // Navigator.of(BuildContext context).push(MaterialPageRoute(
          //     builder: (context) =>
          //         Iphone(name: name, herotag: name, price: price)));
        },
        child: Container(
          height: 175.0,
          width: 130.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: bgcolor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Hero(
                tag: name,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      imgpth,
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 25.0,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 17.0,
                  color: textColor,
                ),
              ),
              Text(
                '\$' + price,
                style: TextStyle(
                  fontSize: 17.0,
                  color: textColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class dataSearch extends SearchDelegate<String> {
  List searchData = [
    'New Arrivals',
    'Electronics',
    'Mobiles',
    'Cars',
    'Clothes',
    'Grocery'
  ];
  List recentData = [
    'New Arrivals',
    'Electronics',
    'Mobiles',
    'Cars',
    'Clothes',
    'Grocery'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query == '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return NewArrivals();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentData
        : searchData.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: const Icon(Icons.call_received_rounded),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}
