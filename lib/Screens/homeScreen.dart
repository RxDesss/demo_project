import 'package:demo_project/GetX%20Controller/loginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LoginController loginController = Get.put(LoginController());
  String? userName;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    for (var obj in loginController.loginList) {
      setState(() {
        userName = obj['user_name'];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            header(context, userName),
            imageCarousel(context, imageList),
          ],
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
                style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.020),
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
        height: 150.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 4/3,
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
              decoration: BoxDecoration(
            
              ),
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