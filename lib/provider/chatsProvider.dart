import 'package:flutter/cupertino.dart';
import 'package:messenger/domain/chat.dart';
import 'package:messenger/domain/message.dart';
import 'package:messenger/domain/user.dart';

class ChatsProvider with ChangeNotifier {
  static List<User> testUsers=[
    User("user1","pass1","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrhdaKGNYcIyXGWO-p59GuRT2FCNGWPmQzyQ&usqp=CAU"),
    User("user2","pass1","https://upload.wikimedia.org/wikipedia/en/2/28/Pok%C3%A9mon_Bulbasaur_art.png"),
    User("user3","pass1","https://upload.wikimedia.org/wikipedia/en/5/59/Pok%C3%A9mon_Squirtle_art.png")
  ];

  List<Chat> allChats = [
    new Chat("POS 4BHIF", [
      new Message("content1a", DateTime.now(),testUsers[0]),
      new Message("content2a", DateTime.now(),testUsers[1]),
      new Message("content3a", DateTime.now(),testUsers[2]),
      new Message("conteddddddddddddddddddddddddddddddddddddddddddddddddddddddnt1a", DateTime.now(),testUsers[0]),
    ],
        DateTime(2022, 2, 2)),
    new Chat("POS 3BHIF", [
      new Message("content1b", DateTime.now(),testUsers[0]),
      new Message("content2b", DateTime.now(),testUsers[1]),
      new Message("content3b", DateTime.now(),testUsers[2]),
    ],
        DateTime(2022, 2, 2)),
  ];


}