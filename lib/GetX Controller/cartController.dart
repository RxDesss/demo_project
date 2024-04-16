import 'dart:convert';
import 'package:demo_project/GetX%20Controller/loginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;


class CartController extends GetxController{
    final LoginController loginController=Get.put(LoginController());
    List<dynamic> Data=[].obs ;
   String Message="";
  Future<void>getAddToCart(  productId,productQuantity,productSku,productPrice)async{

    print(productId);
    print(productQuantity);
    print(productSku);
    print(productPrice);
    print(loginController.userId);
    print(loginController.userEmail);
    // print(userId);
    // print(userEmail);
    String url='https://www.texasknife.com/dynamic/texasknifeapi.php?action=cart&store_id=1&user_id=${loginController.userId}&product_id=${productId}&product_det_qty=${productQuantity}&get_cur_price=${productPrice}&sku=${productSku}&user_email=${loginController.userEmail}&session_ids=123456&based_on=Add';
    var res=await http.get(Uri.parse(url));
    if(res.statusCode==200){
         final body = res.body;
      final json = jsonDecode(body);
        Data= json['data'];
      //  Message=Data[0]['']
      print("Cart Added Sucess");
      print(Data);

    }
  }
}