import 'package:flutter/material.dart';
import 'package:shop_app/Components/bottom_navigation.dart';
import '../models/cart.dart';
class CartScreen extends StatefulWidget {

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: cartItems.isEmpty ? const Center(child: Text("Your cart is empty")) : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: ListTile(
              leading: Image.asset(product["image"]),
              title: Text(product["name"]),
              subtitle: Text("\$${product["price"]}"),
              trailing: IconButton(
                onPressed: () {
                  cartItems.removeAt(index);
                  setState(() {});
                },
                icon: const Icon(Icons.delete),
              )
            )
          );
        }
      ),

    );
  }
}
