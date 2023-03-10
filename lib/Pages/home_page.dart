import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/coffee_tiles.dart';
import '../Utils/coffee_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> coffeeNames = [
    "Cappuccino",
    "Latte",
    "Tea",
    "Mocha",
    "Boba Tea",
    "Espresso"
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        //App bar
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          actions: const [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(Icons.person),
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        //Body
        body: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              //Text find best coffee for you
              child: Text(
                'Find the best coffee for you',
                style: GoogleFonts.bebasNeue(
                    fontSize: 56, fontWeight: FontWeight.bold),
              ),
            ),
            //  Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Find Your Coffee....",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  prefixIcon: const Icon(Icons.search_sharp),
                ),
              ),
            ),
            //Coffee Types
            Container(
              height: 60,
              // padding: EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(right: 20, bottom: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeNames.length,
                itemBuilder: (context, index) {
                  return CoffeeType(
                    coffeeName: coffeeNames[index],
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
            //  ListView Coffee Tiles/Cards

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CoffeeTile(
                      imagePath: 'assets/images/1.jpg',
                      coffeePrice: 4,
                      coffeeDescription: 'Beautiful Heart shaped latte',
                      coffeeName: 'Latte',
                    ),
                    CoffeeTile(
                      imagePath: 'assets/images/3.jpg',
                      coffeePrice: 5,
                      coffeeDescription: 'Traditional Hot Tea',
                      coffeeName: 'Tea',
                    ),
                    CoffeeTile(
                      imagePath: 'assets/images/4.jpg',
                      coffeePrice: 10,
                      coffeeDescription: 'With roasted coffee beans',
                      coffeeName: 'Hot Coffee',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notifications'),
          ],
        ),
      ),
    );
  }
}
