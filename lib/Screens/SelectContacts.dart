import 'package:flutter/material.dart';
import 'package:lone/Screens/ButtonCard.dart';
import 'package:lone/Screens/ContactCard.dart';
import 'package:lone/Model/ChatModel.dart';
import 'package:lone/Screens/CreateProfile.dart';
class SelectContacts extends StatefulWidget {
  const SelectContacts({Key? key}) : super(key: key);

  @override
  _SelectContactsState createState() => _SelectContactsState();
}

class _SelectContactsState extends State<SelectContacts> {
  List<ChatModel> contacts=[
    ChatModel(
      name:"Sahil",
      status:"Never lose hope"
    ),
    ChatModel(
        name:"Afaque",
        status:"ALONE BUT HAPPY"
    ),
    ChatModel(
        name:"Jameel",
        status:"idk,Google it."
    ),
    ChatModel(
        name:"Manove Kumar",
        status:""
    ),
    ChatModel(
        name:"Inayat",
        status:"#109"
    ),
    ChatModel(
        name:"Sarwar",
        status:"Kamrate sarwar janjhi"
    ),
    ChatModel(
        name:"Kalyan",
        status:""
    ),
    ChatModel(
        name:"Majid bhai",
        status:"Majid Pahore"
    ),
    ChatModel(
        name:"Hammad",
        status:":):)"
    ),
    ChatModel(
        name:"Shahzaib",
        status:"hey,Everyone"
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xFF075E54),
        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Select Contacts",style:TextStyle(
                  fontSize: 19,
              fontWeight: FontWeight.bold,
            )),
            Text("12 Contacts",style:TextStyle(
              fontSize: 13,
            )),
          ],
        ),
actions: [
       IconButton(onPressed: (){}, icon: Icon(Icons.search),iconSize: 26,),
  PopupMenuButton<String>(
    padding: EdgeInsets.all(0),
    onSelected: (value) => print(value),
    itemBuilder: (BuildContext context) {

      return[
        PopupMenuItem(child: Text("Invite a friend"),value: "Invite a friend",),
        PopupMenuItem(child: Text("Contacts"),value: "Contacts",),
        PopupMenuItem(child: Text("Refresh"),value: "Refresh",),
        PopupMenuItem(child: Text("Help"),value: "Help",),


      ];
    },)
        ],
      ),
     body: ListView.builder(
       itemCount: contacts.length+2,
       itemBuilder:
         (context, index) {
           if(index==0){
             return InkWell
               (onTap: (){
                 Navigator.push(context,  MaterialPageRoute(builder: (builder)=>CreateProfile()));
             },
                 child: ButtonCard(icon:Icons.group,name:"New Group",contact:contacts[index] ,));
           }
           else if(index==1){
             return ButtonCard(icon:Icons.person_add,name:"New Contact",contact: contacts[index],);
           }
           return ContactCard(
             contact:contacts[index-2],
           );
         }
     ),
    );
  }
}
