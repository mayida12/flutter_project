import 'package:epoch/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<String> categories = ["titan","fastrack","rolex","timex","cartier","dior"];
int _selectedIndex = 0;
int itemsLength = 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title: Text
      (
        "EPOCH",
        style: TextStyle(color: Colors.blue, fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
      backgroundColor: Colors.amber,
      elevation: 0.0,
      actions: [
        Icon(
          Icons.search, color: Colors.black, size: 34.0,
          ),
          SizedBox(width: 10.0),
        Icon(
          Icons.shopping_cart, color: Colors.black, size: 34.0,
          ),
          SizedBox(width: 16.0),
      ],
      
      ),
      
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 32.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context,index) {
              return buildCategory(index);
            }
            ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.75,
                ) ,
                itemCount: 30,
                itemBuilder: (context, index) {
                  return itemCard();
                }),
          ),

        ),
       
      ]),
    );
  }

  Widget buildCategory(int index) {
   return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });


      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style:TextStyle(
              fontWeight : FontWeight.bold,
              fontSize: 18.0,
               color: _selectedIndex == index ? kTextColor :
                kTextLightColor
            ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4),
              height: 2.0,
              width: 48,
              color:_selectedIndex == index ? kTextColor :
                kTextLightColor ,
            )

          ],
        ) ,
        ),
      );
      
     
  }
Widget itemCard() {
  return Column(
    children: [
      Container(
        height: 180 ,
     width: 180, 
    child: Image.asset(
      "assets/titan1.jpg"
      ) ,
      ),

    ],
     
     );
    }
}