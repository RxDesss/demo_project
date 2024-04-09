import 'package:demo_project/GetX%20Controller/homeController.dart';
import 'package:demo_project/GetX%20Controller/loginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final LoginController loginController = Get.put(LoginController());
final HomeContoller homeController=Get.put(HomeContoller());

class _HomeScreenState extends State<HomeScreen> {
  
  String? userName;
  List<String> apiproductNames = [];
  List<String> apiproductPrice = [];
  List<String> apiproductImage = [];
  List<String> apicategoryName = [];
  List<String> apicategoryImage = [];



  void getData() {
    for (var obj in loginController.loginList) {
      setState(() {
        userName = obj['user_name'];
      });
    }
  }
   getFeatueProduct() {
    for (var obj in homeController.featureProductList) {
      
      setState(() {
        apiproductPrice.add(obj['product_price']);
        apiproductNames.add(obj['product_name']);
        apiproductImage.add(obj['product_image']);
        //  print("apiproductNames");
        // print(apiproductNames);
        //  print("apiproductPrice");
        // print(apiproductPrice);
      });
    }
  }

  getCategoryProduct() {
    for (var obj in homeController.categoryProductList) {
      setState(() {
        apicategoryName.add(obj['name']);
        apicategoryImage.add(obj['image']);
        // print(apicategoryName);
      });
    }
  }

  List<String> imageList = [
    'https://cdn.pixabay.com/photo/2015/12/11/17/51/knife-1088529_1280.png',
    'https://images.pexels.com/photos/168804/pexels-photo-168804.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/365631/pexels-photo-365631.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/39011/paprika-vegetables-snack-vegetables-cut-39011.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    // Add more image URLs here
  ];

  List<String> categoryImages = [
    'assets/cimg/1.png',
    'assets/cimg/2.png',
    'assets/cimg/3.png',
    'assets/cimg/4.png',
    'assets/cimg/5.png',
    'assets/cimg/6.png',
    'assets/cimg/7.png',
    'assets/cimg/8.png',
    'assets/cimg/9.png',
    'assets/cimg/10.png',
    'assets/cimg/11.png',
  ];
  @override
  void initState() {
       super.initState();
    getData();
    getFeatueProduct();
    getCategoryProduct();
 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(context, userName),
              imageCarousel(context, imageList),
              search(context),
              categoryImage(context, categoryImages),
              featureProducts(context,apiproductImage,apiproductPrice,apiproductNames),
              categoryProduct(context, apicategoryName, apicategoryImage)
            ],
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context, String? userName) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Hello',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '${userName ?? ''}',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.020),
              ),
            ],
          ),
          Image.asset(
            'assets/TexasImage.png',
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.height * 0.08,
          ),
        ],
      ),
    );
  }

  Widget imageCarousel(BuildContext context, List<String> imageList) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.20,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 4 / 3,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
        items: imageList.map((url) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        }).toList(), // Convert the mapped iterable to a list
      ),
    );
  }
}

Widget search(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.38,
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black12),
            ),
            onPressed: () {},
            // Update starts here
            child: Row(
              mainAxisSize:
                  MainAxisSize.min, // To keep the icon and text close together
              children: [
                Icon(Icons.search, size: 20.0), // Adjust the size as needed
                SizedBox(width: 4), // Space between icon and text
                Text(
                  'Search Code',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            // Update ends here
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.38,
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black12),
            ),
            onPressed: () {},
            // Update starts here
            child: Row(
              mainAxisSize:
              MainAxisSize.min, // To keep the icon and text close together
              children: [
                Icon(Icons.camera_alt, size: 20.0), // Adjust the size as needed
                SizedBox(width: 4), // Space between icon and text
                Text(
                  'Scan Code',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            // Update ends here
          ),
        ),
      ],
    ),
  );
}

Widget categoryImage(context, categoryImages) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          "Category Image",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.13,
        width: MediaQuery.of(context).size.width,
        //  color: Colors.blue,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryImages.length,
          itemBuilder: (context, index) {
            return Container(
         width: MediaQuery.of(context).size.width*0.28, // Set the width of each image container
             
              margin: EdgeInsets.only(
                  left: 10.0, right: index == categoryImages.length - 1 ? 10.0 : 0),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius:
                    BorderRadius.circular(100.0), // Adjust the rounding here
                image: DecorationImage(
            image:AssetImage(categoryImages[index]),
                  fit: BoxFit.scaleDown,
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget featureProducts(context,apiproductImage,apiproductPrice,apiproductNames){
   return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10,top: 10),
        child: Text(
          "Feature Products ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width,
        //  color: Colors.blue,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:homeController.featureProductList.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width*0.30, // Set the width of each image container
             
              margin: EdgeInsets.only(
                  left: 10.0, right: index == apiproductImage.length - 1 ? 10.0 : 0),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius:
                    BorderRadius.circular(10.0), // Adjust the rounding here
               
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                     width: double.infinity,
                    height:  MediaQuery.of(context).size.height * 0.08,
                    color: Colors.amber,
                    child: Image.network(apiproductImage[index],fit: BoxFit.cover,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                     width:MediaQuery.of(context).size.width * 0.13,
                     height:MediaQuery.of(context).size.height * 0.022,
                                     
                     decoration: BoxDecoration(
                        color: Colors.green,
                      borderRadius: BorderRadius.circular(15.0)
                     ),
                     child: Padding(
                       padding: const EdgeInsets.only(left: 3),
                       child: Text("\$${apiproductPrice[index]}",style: TextStyle(fontSize: 12,color: Colors.white),),
                     ),
                    ),
                  ),
                 Padding(
                   padding: const EdgeInsets.all(1.0),
                   child: Container(
                    height:MediaQuery.of(context).size.height * 0.068,
                    child: Center(child: Text("${apiproductNames[index]}", textAlign: TextAlign.center,style: TextStyle(fontSize: 11),overflow: TextOverflow.fade,))),
                 )
                ],),
            );
          },
        ),
      ),
    ],
  );
}
Widget categoryProduct(context, apicategoryName, apicategoryImage) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Text(
          "Products Categories ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      Container(
        height: 300, // Set the desired height for the parent container
        width: double.infinity,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: homeController.categoryProductList.length,
          itemBuilder: ((context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.20,
              decoration: BoxDecoration(border: Border.all(width: 1)),
              margin: EdgeInsets.all(5),
              child: Column(
                children: [
                  Text('${apicategoryName[index]}'),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    color: Colors.amberAccent,
                    alignment: Alignment.center,
                    child: Image.network(
                      '${apicategoryImage[index]}',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    ],
  );
}
