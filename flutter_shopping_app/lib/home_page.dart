import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/cart_page.dart';
import 'package:flutter_shopping_app/product_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   
  int currentPage = 0;
  List<Widget> pages = const [
    ProductList(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value){
          setState(() {
            currentPage = value;
          });
        },
        iconSize: 30,
        selectedFontSize: 0,
        unselectedFontSize: 0,
          items:const[
            BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: '',
      ),
    ],
    ),
    );
  }
}
