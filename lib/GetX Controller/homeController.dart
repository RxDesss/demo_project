
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class HomeContoller extends GetxController{
  List<dynamic> featureProductList=[].obs;
  List<dynamic> categoryProductList=[].obs;

    bool _featureLoaded = false;
  bool _categoryLoaded = false;

  Future<void> fetchDataAndNavigate(context) async {
    await fetchFeatureApi();
    await fetchCategoryApi();
// print(_featureLoaded);
// print(_categoryLoaded);
    if (_featureLoaded && _categoryLoaded) {
      Navigator.pushReplacementNamed(context, '/tabnavigation');
    
    }
  }

  Future<void>  fetchFeatureApi()async{
  String url='https://www.texasknife.com/dynamic/texasknifeapi.php?action=cus_featured_product';
  // print(url);

  var res=await http.get(Uri.parse(url));
  if(res.statusCode==200){
    final body=res.body;
    final json=jsonDecode(body);
    featureProductList=json['data'];
     _featureLoaded = true;
    // print("Feature");
    // print(featureProductList);
  }else{
    print("Feature product list not working");
  }


}

  Future<void> fetchCategoryApi()async{
  String url='https://www.texasknife.com/dynamic/texasknifeapi.php?action=cus_category';
  // print(url);

  var res=await http.get(Uri.parse(url));
  if(res.statusCode==200){
    final body=res.body;
    final json=jsonDecode(body);
    categoryProductList=json['data'];
    _categoryLoaded = true;
    // print("category");
    //  print(categoryProductList);
  }else{
    print("Feature product list not working");
  }


}

  }