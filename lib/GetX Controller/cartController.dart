import 'dart:convert';
import 'package:demo_project/GetX%20Controller/loginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;


class CartController extends GetxController{
    final LoginController loginController=Get.put(LoginController());

  Future<void>getAddToCart(  productId,productQuantity,productSku,productPrice)async{

    print(productId);
    print(productQuantity);
    print(productSku);
    print(productPrice);
    print(loginController.userId);
    print(loginController.userEmail);
    // print(userId);
    // print(userEmail);
    String url='';
    // var res=await http.get(Uri.parse(url));
    // if(res.statusCode==200){

    // }
  }
}