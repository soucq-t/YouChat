import 'package:flutter/cupertino.dart';
import 'package:messenger/domain/chat.dart';
import 'package:messenger/domain/message.dart';
import 'package:messenger/domain/user.dart';
import 'package:provider/provider.dart';

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
    new Chat(
        "POS 4BHIF",
        DateTime.now(),
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/MCM_London_2014_-_Pikachu_%2814266616051%29.jpg/330px-MCM_London_2014_-_Pikachu_%2814266616051%29.jpg",
        [
          new Message("content1a", DateTime.now(), testUsers[0]),
          new Message("content2a", DateTime.now(), testUsers[1]),
          new Message("content3a", DateTime.now(), testUsers[2]),
          new Message(
              "conteddddddddddddddddddddddddddddddddddddddddddddddddddddddnt1a",
              DateTime.now(),
              testUsers[0]),
        ],
        testUsers),
    new Chat(
        "POS 3BHIF",
        DateTime.now(),
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/TOYOTA_ist_Pikachu_Car.jpg/330px-TOYOTA_ist_Pikachu_Car.jpg",
        [
          new Message("content1b", DateTime.now(), testUsers[0]),
          new Message("content2b", DateTime.now(), testUsers[1]),
          new Message("content3b", DateTime.now(), testUsers[1]),
        ],
        [
          testUsers[0],
          testUsers[1],
        ]),
  ];

  void addOrRemoveUserToAChat(User user, Chat chat){

    if(chat.allUsers.contains(user)){
      chat.allUsers.remove(user);
    }else{
      chat.allUsers.add(user);
    }
    notifyListeners();
  }
}
