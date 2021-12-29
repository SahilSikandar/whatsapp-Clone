import 'package:flutter/material.dart';
import 'package:lone/CustomUI/CustomCard.dart';
import 'package:lone/Model/ChatModel.dart';
import 'package:lone/Screens/SelectContacts.dart';
class chat extends StatefulWidget {
  const chat({Key? key}) : super(key: key);

  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
  List<ChatModel> chats=[
    ChatModel(
      name:"Sahil",
      isGroup:false,
      currentmessage:"Hi everyone",
      time:"4:00",
      icon:"img1.svg",
    ),
    ChatModel(
      name:"Family Groups",
      isGroup:true,
      currentmessage:"Hi everyone on this Group",
      time:"10:00",
      icon:"img2.svg",
    ),
    ChatModel(
      name:"Afaque",
      isGroup:false,
      currentmessage:"Ha ada",
      time:"11:00",
      icon:"img1.svg",
    ),
    ChatModel(
      name:"Sarwar",
      isGroup:false,
      currentmessage:"Hi",
      time:"5:00",
      icon:"img1.svg",
    ),
    ChatModel(
      name:"Flutter Community",
      isGroup:true,
      currentmessage:"Hi devs",
      time:"15:00",
      icon:"img2.svg",
    ),
    ChatModel(
      name:"Flutter Help",
      isGroup:true,
      currentmessage:"welcome to the Community",
      time:"9:00",
      icon:"img2.svg",
    ),
    ChatModel(
      name:"Jameel",
      isGroup:false,
      currentmessage:"Ha Bhae",
      time:"10:00",
      icon:"img1.svg",
    ),
    ChatModel(
      name:"Manove Kumar",
      isGroup:false,
      currentmessage:"Don't Know",
      time:"8:00",
      icon:"img1.svg",
    ),
    ChatModel(
      name:"Hammad",
      isGroup:false,
      currentmessage:"ok",
      time:"8:00",
      icon:"img1.svg",
    ),
    ChatModel(
      name:"Shazaib",
      isGroup:false,
      currentmessage:"pata nhe",
      time:"6:00",
      icon:"img1.svg",
    ),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>SelectContacts()));
      },
      child:Icon(Icons.chat),
      backgroundColor: Color(0xFF075E54),),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context,index)
          =>CustomCard(
          chatModel:chats[index],
        ),
      ),
    );
  }
}
