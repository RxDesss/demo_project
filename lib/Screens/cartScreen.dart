import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CartScreeen extends StatefulWidget {
  const CartScreeen({super.key});

  @override
  State<CartScreeen> createState() => _CartScreeenState();
}

class _CartScreeenState extends State<CartScreeen> {
  final FlickManager flickManager=FlickManager(videoPlayerController: VideoPlayerController.networkUrl(Uri.parse("https://videos.pexels.com/video-files/856382/856382-hd_1920_1080_30fps.mp4")));
    // final FlickManager flickManager=FlickManager(videoPlayerController: VideoPlayerController.asset('assets/video1.mp4'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        centerTitle:true,
      ),
      body: SafeArea(child:
       Column(
         children: [
           Center(
            child: AspectRatio(
              aspectRatio: 16/9,
              child: FlickVideoPlayer(flickManager: flickManager),
              ),
           ),
         ],
       )
       ),
    );
  }
}