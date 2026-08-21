import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/Components/bottom_navigation.dart';
import '../models/products.dart';
import '../models/cart.dart';

class ProductsScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductsScreen({super.key, required this.product});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}


class _ProductsScreenState extends State<ProductsScreen> {
  // Recommendation: Pass this product as a parameter later
  late final product = widget.product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(onPressed: () {

          }, icon: const Icon(Icons.favorite_border, color: Colors.black)),
        ],
      ),
      body: Column(
        children: [
          // 1. Large Image with Background Circle
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 300, width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    shape: BoxShape.circle,
                  ),
                ),
                Hero(
                  tag: product["name"], // For smooth transitions
                  child: Image.asset(product["image"], height: 250, fit: BoxFit.contain),
                ),
              ],
            ),
          ),

          // 2. Product Information
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(0xFFFBFBFB), // Slightly different white
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product["category"],
                    style: GoogleFonts.lato(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product["name"],
                    style: GoogleFonts.lato(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    product["description"],
                    style: GoogleFonts.lato(fontSize: 16, color: Colors.black54, height: 1.5),
                  ),
                  const Spacer(),

                  // 3. Bottom Price & Action Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price", style: GoogleFonts.lato(color: Colors.grey)),
                          Text("\$${product["price"]}",
                              style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cartItems.add(product);
                          showModalBottomSheet(context: context, backgroundColor: Colors.white, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
                            builder: (context) {
                          return Container(
                            padding: const EdgeInsets.all(25),
                            height: 250,
                              child:
                                 SingleChildScrollView(
                                   child: Column(
                                    children: [
                                      const Icon (Icons.check_circle, color: Colors.green, size: 50),
                                      const SizedBox(height: 20),
                                      Text("Added to Cart", style: GoogleFonts.lato(color: Colors.grey)),
                                      const SizedBox(height: 20),
                                      Text("${product["name"]} has been added to cart", style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold)),

                                      // 3. Action Button
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () => Navigator.pop(context),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            padding: const EdgeInsets.symmetric(vertical: 15),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                          ),
                                          child: Text("Continue Shopping", style: GoogleFonts.lato(color: Colors.white)),
                                        ),
                                      ),
                                    ],
                                                                   ),
                                 ),
                          );
                        });
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Text("Add to Cart",
                            style: GoogleFonts.lato(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}