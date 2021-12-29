import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:lone/Screens/CameraScreen.dart';
import 'package:lone/pages/CameraPage.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:video_player/video_player.dart';
class VideoView extends StatefulWidget {
  const VideoView({Key? key,required this.path}) : super(key: key);
  final String path;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _controller;

  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.crop_rotate),iconSize: 27,),
          IconButton(onPressed: (){}, icon: Icon(Icons.emoji_emotions_outlined),iconSize: 27,),
          IconButton(onPressed: (){}, icon: Icon(Icons.title),iconSize: 27,),
          IconButton(onPressed: (){}, icon: Icon(Icons.edit),iconSize: 27,),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-150,
              child: _controller.value.isInitialized
                  ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
                  : Container(),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                color: Colors.black,
                child: TextFormField(
                  maxLines: 6,
                  minLines:1 ,
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 17,
                  ),
                  decoration: InputDecoration(
                    hintText: "Add Caption.......",
                    alignLabelWithHint: false,
                    suffixIcon: CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.teal[700],
                      child: Icon(Icons.check,color: Colors.white,size: 27,),
                    ),
                    prefixIcon: Icon(Icons.add_photo_alternate,color: Colors.white,size: 27,),
                    hintStyle: TextStyle(
                      color:Colors.white,
                      fontSize: 17,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){
                  setState(() {
                    _controller.value.isPlaying?_controller.pause():_controller.play();
                  });
                },
                child: CircleAvatar(
                    radius: 33,
                    backgroundColor: Colors.black38,
                    child: Icon(_controller.value.isPlaying?Icons.pause:Icons.play_arrow,color: Colors.white,size: 50,)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
