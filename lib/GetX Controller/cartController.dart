import 'dart:convert';
import 'package:demo_project/GetX%20Controller/loginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;


class CartController extends GetxController{
    final LoginController loginController=Get.put(LoginController());
    List<dynamic> Data=[].obs ;
    List<dynamic> cartData=[].obs;
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

//  Future<dynamic>  getCartItems()async{
//  String url='https://www.texasknife.com/dynamic/texasknifeapi.php?action=final_cart_details&store_id=1&customer_id=${loginController.userId}';
//  var res=await http.get(Uri.parse(url));
//  if(res.statusCode==200){
//   final body=res.body;
//   final json=jsonDecode(body);
//   //  cartData=json['data'];
//   //     print("cart data  :: ${cartData}");
// return json['data'];


//  }
//   }
 Future<List<Map<String, dynamic>>> getCartItems() async {
    String url = 'https://www.texasknife.com/dynamic/texasknifeapi.php?action=final_cart_details&store_id=1&customer_id=${loginController.userId}';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      List<dynamic> data = json['data'];

      // Assuming each item in data is a map
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load cart items');
    }
  }

Future<void> deleteCartItem( productID) async {
  print("Remove button pressed");
  String url = 'https://www.texasknife.com/dynamic/texasknifeapi.php?action=remove_cart&customer_id=${loginController.userId}&session_id=123456&product_id=$productID';

  try {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

    } else {
      throw Exception('Failed to remove cart item: ${response.reasonPhrase}');
    }
  } catch (e) {
    print("Error removing cart item: $e");
    throw Exception('Failed to remove cart item: $e');
  }
}
Future<void> addProductQuantity( productID,total) async {
  print("Remove button pressed");
  String url = 'https://www.texasknife.com/dynamic/texasknifeapi.php?action=sku&id=${productID}';

  try {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      
      final body = response.body;
      final json = jsonDecode(body);
      List<dynamic> data = json['data'];
      String sku=data[0]['sku'];
      print("sku: ${sku}");
 var res = await http.get(Uri.parse("https://www.texasknife.com/dynamic/texasknifeapi.php?action=cart&store_id=1&user_id=${loginController.userId}&product_id=${productID}&product_det_qty=1&get_cur_price=${total}&sku=${sku} &user_email=${loginController.userEmail}&session_ids=123456&based_on=Add"));
   if(res.statusCode==200){
    
   }

    } else {
      throw Exception('Failed to remove cart item: ${response.reasonPhrase}');
    }
  } catch (e) {
    print("Error removing cart item: $e");
    throw Exception('Failed to remove cart item: $e');
  }
}

Future<void> minusProductQuantity( productID,total) async {
  print("Remove button pressed");
  String url = 'https://www.texasknife.com/dynamic/texasknifeapi.php?action=sku&id=${productID}';

  try {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      
      final body = response.body;
      final json = jsonDecode(body);
      List<dynamic> data = json['data'];
      String sku=data[0]['sku'];
      print("sku: ${sku}");
 var res = await http.get(Uri.parse("https://www.texasknife.com/dynamic/texasknifeapi.php?action=cart&store_id=1&user_id=${loginController.userId}&product_id=${productID}&product_det_qty=1&get_cur_price=${total}&sku=${sku} &user_email=${loginController.userEmail}&session_ids=123456&based_on=Minus"));
   if(res.statusCode==200){

   }

    } else {
      throw Exception('Failed to remove cart item: ${response.reasonPhrase}');
    }
  } catch (e) {
    print("Error removing cart item: $e");
    throw Exception('Failed to remove cart item: $e');
  }
}
}