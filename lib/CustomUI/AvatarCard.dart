import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lone/Model/ChatModel.dart';
class AvatarCard extends StatelessWidget {
  const AvatarCard({Key? key,required this.contact}) : super(key: key);
final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueGrey[200],
                radius: 23,
                child: SvgPicture.asset("assets/img1.svg",color:Colors.white,height: 30,width: 30,),
              ),
             Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 11,
                  child: Icon(
                    Icons.clear,
                    color:Colors.white,
                    size: 13,

                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(contact.name,style: TextStyle(
            fontSize: 12
          ),),
        ],
      ),
    );
  }
}
