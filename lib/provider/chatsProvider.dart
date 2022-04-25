import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:messenger/domain/chat.dart';
import 'package:messenger/domain/message.dart';
import 'package:messenger/domain/user.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ChatsProvider with ChangeNotifier {
  static List<User> testUsers = [
    User("user1", "pass1",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrhdaKGNYcIyXGWO-p59GuRT2FCNGWPmQzyQ&usqp=CAU"),
    User("user2", "pass1",
        "https://upload.wikimedia.org/wikipedia/en/2/28/Pok%C3%A9mon_Bulbasaur_art.png"),
    User("user3", "pass1",
        "https://upload.wikimedia.org/wikipedia/en/5/59/Pok%C3%A9mon_Squirtle_art.png")
  ];
  List<Chat> allChats = [
  ];


  void addOrRemoveUserToAChat(User user, Chat chat){

    if(chat.allUserNames.contains(user.username)){
      chat.allUserNames.remove(user.username);
    }else{
      chat.allUserNames.add(user.username);
    }
    notifyListeners();
  }

  late List<Chat> _help;
  Future<void> loadAllChats() async {
    allChats.clear();
    print('loadddd');
    final uri = Uri.parse(
        "https://chenmessenger-default-rtdb.europe-west1.firebasedatabase.app/chats.json");
    final response = await http.get(uri);
    if(response.statusCode == 200){
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      allChats=body
          .entries
          .map((entry) => Chat.fromJson(entry.value,entry.key))
          .toList();
    }
  }
  Future<void> addMessageToAChat(Message message,String chatName) async {
    final uri = Uri.parse(
        "https://chenmessenger-default-rtdb.europe-west1.firebasedatabase.app/chats/"+chatName+"/messages.json");
    final response = await http.post(uri, body: jsonEncode(Message.messageToJson(message)));
    final body = jsonDecode(response.body);
    /*user.username = body['username']; //firebase returnt IMMER name
    _allUsers.add(user);
     */
    notifyListeners();
  }

}
