import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lone/Model/ChatModel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:lone/Screens/CameraScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class individualPage extends StatefulWidget {
  const individualPage({Key? key,required this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  _individualPageState createState() => _individualPageState();
}

class _individualPageState extends State<individualPage> {
  bool show=false;
  FocusNode focusNode=FocusNode();
  TextEditingController _controller=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
        setState(() {
          show=false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar:AppBar(
        leadingWidth: 70,
        titleSpacing: 0,
        backgroundColor: Color(0xFF075E54),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back,size: 24,),
              CircleAvatar(
                child: SvgPicture.asset(
                  widget.chatModel.isGroup ?"assets/img2.svg":"assets/img1.svg",
                  color:Colors.white,
                  width: 37,
                  height: 37,
                ),
                radius: 20,
                backgroundColor: Colors.blueGrey,
              )
            ],
          ),
        ),
        title: InkWell(
          onTap: (){

          },
          child: Container(
            margin: EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chatModel.name,style: TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.bold,
                ),),
                Text("last seen today at 12:05",style: TextStyle(
                  fontSize: 13,
                ),)
              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.videocam),),
          IconButton(onPressed: (){}, icon: Icon(Icons.phone),),
          PopupMenuButton<String>(
            padding: EdgeInsets.all(0),
            onSelected: (value) => print(value),
            itemBuilder: (BuildContext context) {

              return[
                PopupMenuItem(child: Text("View Contact"),value: "View Contact",),
                PopupMenuItem(child: Text("Media, links and docs"),value: "Media, links and docs",),
                PopupMenuItem(child: Text("Whatsapp web"),value: "Whatsapp web",),
                PopupMenuItem(child: Text("Search"),value: "Search",),
                PopupMenuItem(child: Text("Mute Notification"),value: "Mute Notification",),
                PopupMenuItem(child: Text("Wallpaper"),value: "Wallpaper",),

              ];
            },)
        ],
      ),
          body: Container(
        height: MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Stack(
                children: [
                  ListView(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width:MediaQuery.of(context).size.width-60,
                                child: Card(
                                  margin: EdgeInsets.only(left: 2,right: 2,bottom: 8),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),),
                                    child: TextFormField(
                                      controller: _controller,
                                      focusNode: focusNode,
                                      textAlignVertical: TextAlignVertical.center,
                                      keyboardType: TextInputType.multiline,
                                      maxLines:5,
                                      minLines:1,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type a message",
                                        contentPadding: EdgeInsets.all(5),
                                        prefixIcon: IconButton(onPressed: (){
                                          setState(() {
                                            show =!show;
                                            focusNode.unfocus();
                                            focusNode.canRequestFocus=false;
                                          });
                                        }, icon: Icon(Icons.emoji_emotions_outlined),color:  Color(0xFF075E54),),
                                        suffixIcon:Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(onPressed: (){
                                              setState(() {
                                                showModalBottomSheet(
                                                    backgroundColor: Colors.transparent,
                                                    context: context, builder: (builder)=>bottomsheet());
                                              });
                                            }, icon: Icon(Icons.attach_file),color:  Color(0xFF075E54),),
                                            IconButton(onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (builder)=>CameraScreen()));
                                            }, icon: Icon(Icons.camera_alt),color:  Color(0xFF075E54),)
                                          ],
                                        )
                                      ),
                                    ))
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8,right: 5,left: 2),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Color(0xFF075E54),
                                child: IconButton(onPressed: (){}, icon: Icon(Icons.mic),color:Colors.white),
                              ),
                            ),
                          ],
                        ),
                        show?emojiSelect():Container(),
                      ],
                    ),
                  )
                ],
              ),
              onWillPop: (){
                if(show){
                  setState(() {
                    show=false;
                  });
                }
                else{
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
    ),
    );
  }
  Widget bottomsheet(){
    return Container(
      height: 278,
      width:MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.insert_drive_file,Colors.indigo,"Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.camera_alt,Colors.pink,"Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.insert_photo,Colors.purple,"Gallery"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.headset,Colors.deepOrange,"Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.location_pin,Color(0xFF075E54),"Location"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.person,Colors.blue,"Contacts"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget iconcreation(IconData icon,Color color,String text){
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(icon,
            color:Colors.white,
            size: 29,),
          ),
          SizedBox(
            height: 5,
          ),
          Text(text,style: TextStyle(
            fontSize: 12,
          ),)
        ],
      ),
    );
  }
  Widget emojiSelect(){
    return EmojiPicker(
      rows: 4,
        columns: 7,
        onEmojiSelected:(emoji,category){
      print(emoji);
      setState(() {
        _controller.text=_controller.text+emoji.emoji;
      });
    });
  }
}
