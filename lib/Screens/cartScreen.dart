import 'package:demo_project/GetX%20Controller/cartController.dart';
import 'package:demo_project/GetX%20Controller/productdetailController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartScreeen extends StatefulWidget {
  const CartScreeen({super.key});

  @override
  State<CartScreeen> createState() => _CartScreeenState();
}

class _CartScreeenState extends State<CartScreeen> {
  final CartController cartController = Get.put(CartController());
  final ProductDetailContoller productDetailContoller=Get.put(ProductDetailContoller());
  late Future<List<Map<String, dynamic>>> _futureCartData; // Adjusted type
  void _fetchCartData() {
    _futureCartData = cartController.getCartItems();
    _futureCartData.catchError((error) {
      print("Error occurred while fetching cart items: $error");
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchCartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _futureCartData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              // Data is loaded
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 147, 183, 245)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                height:
                                    MediaQuery.of(context).size.height * 0.10,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blueGrey[50]),
                                child: Image.network(
                                  snapshot.data![index]['product_image'],
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                // color: Colors.deepOrange,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        iconSize: 18.0,
                                        onPressed: () {
                                          cartController
                                        .minusProductQuantity(
                                            snapshot.data![index]['id'],snapshot.data![index]['total'])
                                        .then((_) {
                                      setState(() {
                                        _fetchCartData();
                                      });
                                    });
                                        },
                                        icon: Icon(Icons.remove)),
                                    Text(snapshot.data![index]['quantity']),
                                    IconButton(
                                        iconSize: 18.0,
                                        onPressed: () {
                                           cartController
                                        .addProductQuantity(
                                            snapshot.data![index]['id'],snapshot.data![index]['total'])
                                        .then((_) {
                                      setState(() {
                                        _fetchCartData();
                                      });
                                    });
                                        },
                                        icon: Icon(Icons.add)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: double.infinity,
                                // color: Colors.blueGrey,
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      child: Text(
                                        snapshot.data![index]['product_name'],
                                        style: TextStyle(
                                            overflow: TextOverflow.fade,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Quantity : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(snapshot.data![index]['quantity']),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "TotalPrice : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            "\$ ${snapshot.data![index]['total'].toString().length >= 5 ? snapshot.data![index]['total'].toString().substring(0, 5): snapshot.data![index]['total'].toString()}"),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            //  color: Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: IconButton(
                                    icon: Icon(Icons.info), // Icon to display
                                    onPressed: () {
                                           productDetailContoller.getProductDetail(snapshot.data![index]['id']);
                                    },
                                    color: Color.fromARGB(
                                        255, 6, 104, 11), // Color of the icon
                                    iconSize: 20.0, // Size of the icon
                                    tooltip:
                                        'Love', // Tooltip to display on long press
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete), // Icon to display
                                  onPressed: () {
                                    cartController
                                        .deleteCartItem(
                                            snapshot.data![index]['id'])
                                        .then((_) {
                                      setState(() {
                                        _fetchCartData();
                                      });
                                    });

                                  },
                                  color: Color.fromARGB(
                                      255, 243, 34, 34), // Color of the icon
                                  iconSize: 20.0, // Size of the icon
                                  tooltip:
                                      'Love', // Tooltip to display on long press
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
