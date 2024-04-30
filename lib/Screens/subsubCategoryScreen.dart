import 'package:flutter/material.dart';

class SubSubCategoryPage extends StatefulWidget {
  const SubSubCategoryPage({super.key});

  @override
  State<SubSubCategoryPage> createState() => _SubSubCategoryPageState();
}

class _SubSubCategoryPageState extends State<SubSubCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("SubSubCategory screen")),
    );
  }
}