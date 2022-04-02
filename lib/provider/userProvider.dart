import 'package:flutter/cupertino.dart';
import 'package:messenger/domain/user.dart';

class UserProvider with ChangeNotifier {
  final List<User> _allUsers = [
    User("user1", "pass1",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrhdaKGNYcIyXGWO-p59GuRT2FCNGWPmQzyQ&usqp=CAU"),
    User("user2", "pass1",
        "https://upload.wikimedia.org/wikipedia/en/2/28/Pok%C3%A9mon_Bulbasaur_art.png"),
    User("user3", "pass1",
        "https://upload.wikimedia.org/wikipedia/en/5/59/Pok%C3%A9mon_Squirtle_art.png")
  ];
  late User _currentUser;

  List<User> get allUsers => _allUsers;

  bool validUser(String name, String password) {
    print(name + password);
    bool valid = false;
    _allUsers.forEach((element) {
      if(element.username == name && element.password == password){
        valid=true;
        _currentUser=element;
      }
    });
    return valid;
  }

  User get currentUser => _currentUser;
}