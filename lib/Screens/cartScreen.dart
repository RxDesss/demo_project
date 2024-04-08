import 'package:flutter/material.dart';

class CartScreeen extends StatefulWidget {
  const CartScreeen({super.key});

  @override
  State<CartScreeen> createState() => _CartScreeenState();
}

class _CartScreeenState extends State<CartScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("cart screen")),
    );
  }
}