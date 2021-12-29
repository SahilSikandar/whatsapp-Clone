import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lone/Model/ChatModel.dart';
import 'package:lone/pages/ChatPage.dart';
class ButtonCard extends StatelessWidget {
  const ButtonCard({Key? key,required this.contact,required this.name,required this.icon}) : super(key: key);
  final ChatModel contact;
  final String name;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(0xFF25D366),
        radius: 23,
        child: Icon(icon,color:Colors.white,size: 26,),
      ),
      title: Text(
        name,
        style:TextStyle(
          fontSize:  15,
          fontWeight: FontWeight.bold,
        ),
      ),

    );
  }
}
