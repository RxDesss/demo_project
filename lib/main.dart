import 'package:demo_project/Screens/QRScanPage.dart';
import 'package:demo_project/Screens/homeScreen.dart';
import 'package:demo_project/Screens/loginScreen.dart';
import 'package:demo_project/Screens/myOrders.dart';
import 'package:demo_project/Screens/productdetailScreen.dart';
import 'package:demo_project/Screens/registerScreen.dart';
import 'package:demo_project/Screens/searchProduct.dart';
import 'package:demo_project/Screens/tabNavigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginscreen',
      routes: {
        '/loginscreen':(context)=>const LoginScreen(),
        '/registescreen':(context)=>const RegisterScreen(),
        '/tabnavigation':(context)=>const TabNavigation(),
        '/myorders':(context)=>const MyOrders(),
        '/productdetail':(context)=>const ProductDetailScreen(),
        '/searchproduct':(context)=>const SearchProduct(),
        '/qrscanpage':(context)=>QRScanPage(),
      },
    );
  }
}