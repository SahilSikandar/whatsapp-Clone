class ChatModel{
  var name;
  var icon;
  var isGroup;
  var time;
  var currentmessage;
  var status;
  bool select=false;
  ChatModel(
  {this.name, this.icon, this.isGroup, this.time, this.currentmessage,this.status,this.select=false}
      );
}