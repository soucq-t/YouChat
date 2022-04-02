import 'package:messenger/domain/message.dart';
import 'package:messenger/domain/user.dart';

class Group{
  String groupName;
  List<User> allUsers;
  List<Message> allMessages;
  DateTime createDate;

  Group(this.groupName, this.allUsers, this.allMessages, this.createDate);
}