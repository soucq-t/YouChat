import 'package:messenger/domain/user.dart';

class Message {
  String content;
  DateTime dateTime;
  String username;

  Message(this.content, this.dateTime, this.username);

   static Map<String, dynamic> messageToJson(Message message){
     return {
       "content": message.content,
       "dateTime": message.dateTime.toString(),
       "username":message.username
     };
   }
}