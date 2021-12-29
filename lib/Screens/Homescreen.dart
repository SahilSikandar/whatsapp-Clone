import 'package:flutter/material.dart';
import 'package:lone/pages/CameraPage.dart';
import 'package:lone/pages/ChatPage.dart';
import 'package:lone/Screens/CameraScreen.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 4, vsync: this,initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whatsapp Clone"),
        backgroundColor: Color(0xFF075E54),
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.search)),
          PopupMenuButton<String>(
            onSelected: (value) => print(value),
            itemBuilder: (BuildContext context) {
            
            return[
              PopupMenuItem(child: Text("New group"),value: "New group",),
              PopupMenuItem(child: Text("New broadcast"),value: "New broadcast",),
              PopupMenuItem(child: Text("Whatsapp web"),value: "Whatsapp web",),
              PopupMenuItem(child: Text("Linked devices"),value: "Linked devices",),
              PopupMenuItem(child: Text("Starred message"),value: "Starred message",),
              PopupMenuItem(child: Text("Settings"),value: "Settings",),

            ];
          },)
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(icon: Icon(Icons.camera_alt,)),
            Tab(text: "CHATS",),
            Tab(text: "STATUS",),
            Tab(text: "CALLS",)
          ],

        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
         CameraPage(),
          chat(),
          Text("Status"),
          Text("Calls")
        ],
      ),
    );
  }
}
