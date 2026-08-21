import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/home_screen.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  const BottomNavigation({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if(index == 0) {
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Homescreen()),
          );
        }
        else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "Cart",
          activeIcon: Icon(Icons.shopping_cart_outlined),
        ),
      ],

    );

  }
}
