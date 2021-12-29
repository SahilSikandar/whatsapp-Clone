import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:lone/Screens/CameraView.dart';
import 'package:lone/Screens/VideoView.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io';
late List cameras;
class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key,this.path:true}) : super(key: key);
   final bool path;
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
 String videopath="";
  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool isrecording=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController=CameraController(cameras[0], ResolutionPreset.high);
    cameraValue=_cameraController.initialize();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return CameraPreview(_cameraController);
    }
          else{
            return Center(
            child: CircularProgressIndicator(),
            );
    }
          }),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 5,bottom: 5),
              width: MediaQuery.of(context).size.width,
              child:Column(
                children: [
                  Row(
                    mainAxisSize:MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.flash_off),color:Colors.white,iconSize: 28,),
              GestureDetector(
                onLongPress: ()async{
                  await _cameraController.startVideoRecording();
                  setState(() {
                    isrecording=true;

                  });
                },
                onLongPressUp: ()async{
                  XFile videopath= await _cameraController.stopVideoRecording();
                  setState(() {
                    isrecording=false;
                  });
                  Navigator.push(context,MaterialPageRoute(builder: (builder)=>VideoView(path: videopath.path,)));

                },
                onTap: (){
                  if(isrecording==false) {
                    takePhoto(context);
                  }

                },
                child: isrecording?Icon(Icons.radio_button_on,color: Colors.red,size: 80,):Icon(
                Icons.panorama_fish_eye,
                color:Colors.white,
                size: 70,
                ),
              ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.flip_camera_ios),color:Colors.white,iconSize: 28,),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text("Hold for video,tap for photo",style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void takePhoto(BuildContext context) async{
    // final path= join((await getTemporaryDirectory()).path,"${DateTime.now()}.png");
    XFile path=await _cameraController.takePicture();
    await _cameraController.takePicture();
    Navigator.push(context, MaterialPageRoute(builder: (builder)=>CameraView(path:path.path,)));

  }
}
