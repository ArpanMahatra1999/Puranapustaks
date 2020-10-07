import 'package:flutter/material.dart';

//constants
import 'package:puranapustaks/constants/customColor.dart';

//my own packages
import 'package:puranapustaks/shared/basketContents.dart';

class Basket extends StatefulWidget {
  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basket"),
        actions: [
          IconButton(icon: Icon(Icons.search), color: Colors.white, onPressed: (){}),
        ],
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Arpan Mahatra"),
              accountEmail: Text("arpanmahatra1999@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: createMaterialColor(Color(0xFF129935)),),
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home, color: createMaterialColor(Color(0xFF129935)),),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text("Account"),
                leading: Icon(Icons.person, color: createMaterialColor(Color(0xFF129935)),),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text("Orders"),
                leading: Icon(Icons.shopping_basket, color: createMaterialColor(Color(0xFF129935)),),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text("Categories"),
                leading: Icon(Icons.dashboard, color: createMaterialColor(Color(0xFF129935)),),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text("Favorites"),
                leading: Icon(Icons.favorite, color: createMaterialColor(Color(0xFF129935)),),
              ),
            ),
            Divider(),
            InkWell(
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings, color: createMaterialColor(Color(0xFF129935)),),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text("About"),
                leading: Icon(Icons.help, color: createMaterialColor(Color(0xFF129935)),),
              ),
            )
          ],
        ),
      ),
      body: Container(child: BasketProducts()),
      bottomNavigationBar: BottomNavigationBarBasket(),
    );
  }
}
