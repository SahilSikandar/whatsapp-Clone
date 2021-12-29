import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:lone/CustomUI/AvatarCard.dart';
import 'package:lone/Screens/ButtonCard.dart';
import 'package:lone/Screens/ContactCard.dart';
import 'package:lone/Model/ChatModel.dart';
class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
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
  List<ChatModel>groups=[

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
            Text("New Group",style:TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            )),
            Text("Add particpants",style:TextStyle(
              fontSize: 13,
            )),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search),iconSize: 26,),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length+1,
              itemBuilder:
                  (context, index) {
                if(index==0){
                  return Container(
                    height: groups.length>0?90:10,
                  );
                }
                return InkWell(
                  onTap: (){
                    if(contacts[index-1].select==false){
                      setState(() {
                        contacts[index-1].select=true;
                        groups.add(contacts[index-1]);
                      });
                    }
                    else{
                      setState(() {
                        contacts[index-1].select=false;
                        groups.remove(contacts[index-1]);
                      });
                    }

                  },
                  child: ContactCard(
                    contact:contacts[index-1],
                  ),
                );
              }
          ),
          groups.length>0?Column(
            children: [
              Container(
                height: 71,
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: contacts.length,
                  itemBuilder:(context,index){
                    if(contacts[index].select==true){
                      return InkWell(
                          onTap: (){
                            setState(() {
                              groups.remove(contacts[index]);
                              contacts[index].select=false;
                            });
                          },
                          child: AvatarCard(contact: contacts[index]));
                    }
                    else{
                      return Container();
                    }
                  }
                ),
              ),
              Divider(
                thickness: 1,
              )
            ],
          ):Container(),
        ],
      ),
    );
  }
}
