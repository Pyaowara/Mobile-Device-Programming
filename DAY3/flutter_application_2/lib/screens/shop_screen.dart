import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../models/product.dart';

class ShopScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Laptop', price: '25000', icon: Icons.laptop_mac),
    Product(name: 'Smartphone', price: '15000', icon: Icons.smartphone),
    Product(name: 'Headphones', price: '3000', icon: Icons.headset),
    Product(name: 'Smartwatch', price: '5000', icon: Icons.watch),
  ];

  ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Shop')),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _buildHeader(),
          SizedBox(height: 20),
          Text(
            'New Arrivals',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return // --- ส่วนที่ 1: Header (Banner) ---
    Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          'Welcome to IT Shop',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
