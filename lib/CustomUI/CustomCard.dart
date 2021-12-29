import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:lone/Model/ChatModel.dart';
import 'package:lone/Screens/individualPage.dart';
class CustomCard extends StatelessWidget {
  const CustomCard({Key? key,required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (Context)=>individualPage(chatModel: chatModel,)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                  chatModel.isGroup ?"assets/img2.svg":"assets/img1.svg",
              color:Colors.white,
              width: 37,
                height: 37,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(chatModel.name,style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),
            subtitle:Row(
            children: [
              Icon(Icons.done_all),
              SizedBox(width: 3,),
              Text(chatModel.currentmessage,style: TextStyle(
                fontSize: 16,
              ),),
            ],
            ),
            trailing: Text(chatModel.time),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20,left: 80),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );

  }
}
