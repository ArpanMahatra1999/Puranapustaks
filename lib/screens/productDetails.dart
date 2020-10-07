import 'package:flutter/material.dart';

//constants
import 'package:puranapustaks/constants/customColor.dart';
import 'package:puranapustaks/shared/details.dart';
import 'package:puranapustaks/shared/products.dart';

class ProductDetails extends StatefulWidget {

  //define all products' attributes

  final String name;
  final int oldPrice;
  final String picture;
  final String description;
  final int numbers;
  final String category;

  ProductDetails({
    this.name,
    this.oldPrice,
    this.picture,
    this.description,
    this.numbers,
    this.category
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        actions: [
          IconButton(icon: Icon(Icons.search), color: Colors.white, onPressed: (){}),
          IconButton(icon: Icon(Icons.shopping_basket), color: Colors.white, onPressed: (){},)
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
      body: Container(
        child: Details(widget.name, widget.oldPrice, widget.picture, widget.description, widget.numbers, widget.category),
      ),
    );
  }
}
