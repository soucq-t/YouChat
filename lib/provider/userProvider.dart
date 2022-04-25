import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:messenger/domain/user.dart';

class UserProvider with ChangeNotifier {
  final List<User> _allUsers = [
    User("user1", "pass1",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrhdaKGNYcIyXGWO-p59GuRT2FCNGWPmQzyQ&usqp=CAU"),
    User("user2", "pass1",
        "https://upload.wikimedia.org/wikipedia/en/2/28/Pok%C3%A9mon_Bulbasaur_art.png"),
    User("user3", "pass1",
        "https://upload.wikimedia.org/wikipedia/en/5/59/Pok%C3%A9mon_Squirtle_art.png"),
    User("user4", "pass1",
        "https://upload.wikimedia.org/wikipedia/en/5/59/Pok%C3%A9mon_Squirtle_art.png"),
    User("user5", "pass1",
        "https://upload.wikimedia.org/wikipedia/en/5/59/Pok%C3%A9mon_Squirtle_art.png")
  ];
  late User _currentUser;
  late List<User> _help;

  List<User> get allUsers => _allUsers;

  bool validUser(String name, String password) {
    print(name + password);
    bool valid = false;
    _allUsers.forEach((element) {
      if (element.username == name && element.password == password) {
        valid = true;
        _currentUser = element;
      }
    });
    return valid;
  }

  Future<void> loadAllUser() async {
    print('loadd');
    final uri = Uri.parse(
        "https://chenmessenger-default-rtdb.europe-west1.firebasedatabase.app/users.json");
    final response = await http.get(uri);
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    _help=body.entries.map((e) => User.fromJson(e.value)).toList();
    print(_help);
  }

  Future<void> addUser(User user) async {
    final uri = Uri.parse(
        "https://chenmessenger-default-rtdb.europe-west1.firebasedatabase.app/users.json");
    final response = await http.post(uri, body: jsonEncode(user.toJson()));
    final body = jsonDecode(response.body);
    user.username = body['username']; //firebase returnt IMMER name
    _allUsers.add(user);
    notifyListeners();
  }

  User get currentUser => _currentUser;
}
