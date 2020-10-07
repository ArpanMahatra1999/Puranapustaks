import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//constants
import 'package:puranapustaks/constants/customColor.dart';

class BasketProducts extends StatefulWidget {
  @override
  _BasketProductsState createState() => _BasketProductsState();
}

class _BasketProductsState extends State<BasketProducts> {

  var booksOnBasket = [
    {
      "Name": "Radha",
      "Old Price": 500,
      "Picture": "images/registered/nepali/R1.jpg",
      "Description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id varius mi. Sed sed orci est. Morbi maximus sit amet justo eget accumsan. Sed id varius velit. Donec faucibus, diam non maximus lobortis, nisl eros auctor leo, vel tincidunt massa augue hendrerit sapien. Mauris mollis vehicula nisl, id feugiat felis semper vitae. Nam vel vehicula augue. Pellentesque scelerisque dui at magna lobortis, id bibendum odio tristique. Cras iaculis, felis vitae aliquam auctor, nisi tellus venenatis magna, quis finibus quam magna nec felis. Nunc eu massa sit amet leo sagittis ornare. Praesent tincidunt, mauris fermentum commodo hendrerit, odio eros accumsan turpis, id porta diam tortor non eros. Etiam id felis eu sapien tristique auctor. Vivamus vel rutrum ipsum. Duis vel nisl pulvinar odio dictum elementum eu sed ante. Pellentesque semper, sapien nec dapibus interdum, lectus enim ultrices magna, ut elementum augue risus aliquam ante. Etiam eget libero at ipsum bibendum suscipit.",
      "Buy": 4,
      "Rent": 1,
      "Category":"NEPALI"
    },
    {
      "Name": "Oxford Encyclopedia of World History",
      "Old Price": 3000,
      "Picture": "images/registered/others/OEOWH1.jpg",
      "Description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id varius mi. Sed sed orci est. Morbi maximus sit amet justo eget accumsan. Sed id varius velit. Donec faucibus, diam non maximus lobortis, nisl eros auctor leo, vel tincidunt massa augue hendrerit sapien. Mauris mollis vehicula nisl, id feugiat felis semper vitae. Nam vel vehicula augue. Pellentesque scelerisque dui at magna lobortis, id bibendum odio tristique. Cras iaculis, felis vitae aliquam auctor, nisi tellus venenatis magna, quis finibus quam magna nec felis. Nunc eu massa sit amet leo sagittis ornare. Praesent tincidunt, mauris fermentum commodo hendrerit, odio eros accumsan turpis, id porta diam tortor non eros. Etiam id felis eu sapien tristique auctor. Vivamus vel rutrum ipsum. Duis vel nisl pulvinar odio dictum elementum eu sed ante. Pellentesque semper, sapien nec dapibus interdum, lectus enim ultrices magna, ut elementum augue risus aliquam ante. Etiam eget libero at ipsum bibendum suscipit.",
      "Buy": 1,
      "Rent": 40,
      "Category":"OTHERS"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: booksOnBasket.length,
        itemBuilder: (BuildContext context, int index){
          return SingleBook(
            name: booksOnBasket[index]["Name"],
            oldPrice: booksOnBasket[index]["Old Price"],
            picture: booksOnBasket[index]["Picture"],
            description: booksOnBasket[index]["Description"],
            buy: booksOnBasket[index]["Buy"],
            rent: booksOnBasket[index]["Rent"],
            category: booksOnBasket[index]["Category"],
          );
        }
    );
  }
}

class SingleBook extends StatelessWidget {

  final String name;
  final int oldPrice;
  final String picture;
  final String description;
  final int buy;
  final int rent;
  final String category;

  SingleBook({
    this.name,
    this.oldPrice,
    this.picture,
    this.description,
    this.buy,
    this.rent,
    this.category
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(picture, fit: BoxFit.cover,),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Container(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/12,
                height: MediaQuery.of(context).size.height/40,
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Buy: ", textAlign: TextAlign.left,),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/6,
                child: Row(
                  children: [
                    Icon(Icons.arrow_left),
                    Text(buy.toString()),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/30,
                child: Text(" "),
              ),
              Container(
                width: MediaQuery.of(context).size.width/12,
                height: MediaQuery.of(context).size.height/40,
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Rent: ", textAlign: TextAlign.left,),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/6,
                child: Row(
                  children: [
                    Icon(Icons.arrow_left),
                    Text(rent.toString()),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width/5,
                  height: MediaQuery.of(context).size.height/40,
                  alignment: Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Rs. " + (((buy*oldPrice*0.5).toInt()+(rent*oldPrice * 0.5).toInt()).toString()), textAlign: TextAlign.left,),
                ],
              )
              ),
              ],
          ),
        )
      ),
    );
  }
}


class BottomNavigationBarBasket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
              child: ListTile(
                title: Text('Total'),
                subtitle: Text('Rs. 1000'),
              )
          ),
          Expanded(
              child: MaterialButton(
                onPressed: (){},
                child: Text('OK', style: TextStyle(color: Colors.white),),
                color: createMaterialColor(Color(0xFF129935)),
              )
          )
        ],
      ),
    );
  }
}
