import 'dart:convert';
import 'dart:ffi';
import 'package:demo_project/GetX%20Controller/addressControlle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'cartController.dart';
import 'homeController.dart';
import '../Screens/shippingScreen.dart';


class ShippingController extends GetxController {
  final HomeContoller homeContoller = Get.find();
  final CartController cartController = Get.find();
  final AddressController addressController=Get.put(AddressController());
  RxList<dynamic> continueToPayment = <dynamic>[].obs;
  RxList<dynamic> orderTaxData = <dynamic>[].obs;
   List<dynamic> shippingMethodsData = [].obs;
  RxBool isLoadingShippingAPI = true.obs;
  RxString shippingMethodTax=''.obs;
  RxString EstimatedSalesTax=''.obs;
  RxString combainedRate=''.obs;

  get selectedOption => null;

  void shipping() async{
 await addressController.fetchOldAddress();
    Get.to(() => ShippingScreen());
    fetchOrderTax();
    cartController.getCartItems();
    fetchShippingMethods();

  }

  Future<void> fetchContinueToPayment() async {
    String url = "";
    print('fetchContinueToPayment: $url');
    try {
      var res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final body = res.body;
        final json = jsonDecode(body);
        continueToPayment.assign(json['data']);
        
        print("continueToPayment");
        print(continueToPayment);
      }
    } catch (e) {
      print('Error in fetchContinueToPayment: $e');
    }
  }
  

  Future<void> fetchOrderTax() async {
    String url ="https://www.texasknife.com/dynamic/texasknifeapi.php?action=get_tax_details&shipping_state=${addressController.AddressDatas[0]['bill_state_region1']}";
    print('fetchOrderTaxurl : $url');
    try {
      var res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final body = res.body;
        final json = jsonDecode(body);
        orderTaxData.assign(json['data'][0]);
        isLoadingShippingAPI.value = false;
        combainedRate.value=orderTaxData[0]['combined_rate'];
        print("combained rate in : ${combainedRate}");
        print("orderTaxData");
        print(orderTaxData);
      }
    } catch (e) {
      print('Error in fetchOrderTax: $e');
    }
  }

  Future<void> fetchShippingMethods() async {
    String url ="https://texasknife.com/dynamic/texasknifeapi.php?action=ups_shippment_ys&pounds=2&shipping_city=${addressController.AddressDatas[0]['bill_town_city']}&shipping_state=${addressController.AddressDatas[0]['bill_state_region1']}&shipping_zip=${addressController.AddressDatas[0]['bill_zip_code']}&ship_country=${addressController.AddressDatas[0]['bill_country']}";
    print('shippingMethodsData Url : $url');
    try {
      var res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final body = res.body;
        final json = jsonDecode(body);
        shippingMethodsData.assign(json['data'][0]);
        print("shippingMethodsData");
        print(shippingMethodsData);
      }
    } catch (e) {
      print('Error in shippingMethodsData: $e');
    }
  }

void getEstimatedSalesTax(){
    
}
  


}
