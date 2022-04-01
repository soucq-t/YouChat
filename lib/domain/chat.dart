import 'package:messenger/domain/message.dart';

class Chat{
  String chatName;
  List<Message> allMessages;
  DateTime dateTime;

  Chat(this.chatName, this.allMessages, this.dateTime);
}