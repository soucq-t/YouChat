import 'package:messenger/domain/message.dart';
import 'package:messenger/domain/user.dart';

class Chat{
  String chatName;
  DateTime dateTime;
  String picUrl;
  List<Message> allMessages;
  List<User> allUsers;
  User? creater;

  Chat(this.chatName, this.dateTime, this.picUrl, this.allMessages,
      this.allUsers, [this.creater]);
}