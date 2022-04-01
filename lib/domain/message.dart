import 'package:messenger/domain/user.dart';

class Message {
  String content;
  DateTime dateTime;
  User user;

  Message(this.content, this.dateTime, this.user);
}