import 'package:messenger/domain/message.dart';
import 'package:messenger/domain/user.dart';

class Chat {
  String chatId;
  String chatName;
  DateTime dateTime;
  String picUrl;
  List<Message> allMessages;
  List<String> allUserNames;
  String? creater;


  Chat(this.chatName, this.dateTime, this.picUrl, this.allMessages, this.allUserNames, this.chatId,[this.creater,]);

  static Chat fromJson(Map<String, dynamic> json,String id) {
    return Chat(json['chatName'], DateTime.now(), json['picUrl'],
        fromJsonMessages(json.entries.firstWhere((element) => element.key == "messages")),
        fromJsonUserNames(json['users']),id,
        json['creatername']);

  }



  static List<Message> fromJsonMessages(MapEntry<String, dynamic> json) {
    List<Message> allMessages = [];
    if (json.value
        .toString()
        .isNotEmpty) {
      var everyMessageEintrag = json.value as Map<String, dynamic>;
      everyMessageEintrag.forEach((key, value) {
        allMessages.add(
            Message(value['content'], DateTime.now(), value['username']));
      });
    } else {
      allMessages.add(Message("Welcome", DateTime.now(), 'username'));
    }
    return allMessages;
  }

  static List<String> fromJsonUserNames(Map<String, dynamic> json) {
    if (json.entries.length == 1) {
      return json.entries.map((e) => e.value.toString()).toList();
    }
    return json.entries.map((e) => e.value['username'].toString()).toList();
  }




}