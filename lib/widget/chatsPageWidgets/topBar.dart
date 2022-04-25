import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/domain/user.dart';
import 'package:messenger/provider/chatsProvider.dart';
import 'package:messenger/provider/userProvider.dart';
import 'package:provider/provider.dart';

class TopBar extends StatelessWidget {
  final double popupItemSize = 150;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () => Provider.of<ChatsProvider>(context,listen: false).loadAllChats(), icon: Icon(Icons.search)),
        PopupMenuButton(
          icon: Icon(Icons.add_circle),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: SizedBox(
                width: popupItemSize,
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Add Freind"),
                  ],
                ),
              ),
              onTap: () => Provider.of<UserProvider>(context,listen: false).addUser(User("tommy","tommy","https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Pig_farm_Vampula_9.jpg/450px-Pig_farm_Vampula_9.jpg")),
            ),
            PopupMenuItem(
              child: Container(
                width: popupItemSize,
                child: Row(
                  children: [
                    Icon(
                      Icons.group_add,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text("Add Group Chat"),
                  ],
                ),
              ),
              onTap: () => print('AddGroups'),
            ),
          ],
        )
      ],
    );
  }
}
