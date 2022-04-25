import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/domain/chat.dart';
import 'package:messenger/provider/chatsProvider.dart';
import 'package:messenger/provider/userProvider.dart';
import 'package:provider/provider.dart';

class ChatDetail extends StatelessWidget {
  static var route = "chat_detail";

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var chatProvider = Provider.of<ChatsProvider>(context);
    var chat = ModalRoute.of(context)?.settings.arguments as Chat;
    var size = MediaQuery.of(context).size;
    void showdialog(int index) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Change User'),
            content: Text('Do you really wanna remove or add this user?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(context);
                  chatProvider.addOrRemoveUserToAChat(
                      userProvider.allUsers[index], chat);
                },
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Details"),
      ),
      body: Container(
        color: Colors.grey,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              width: 50,
              color: Colors.red,
              child: Image.network(chat.picUrl),
            ),
            Container(
              color: Colors.red,
              child: Text(chat.chatName),
            ),
            Container(
              color: Colors.red,
            ),

            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: Colors.black.withOpacity(0.1))),
                        color: Colors.white70),
                    child: ListTile(
                      leading: Container(
                        width: 70,
                        margin: EdgeInsets.only(right: 15),
                        child:
                            Image.network(userProvider.allUsers[index].picurl),
                      ),
                      title: Text(
                        userProvider.allUsers[index].username,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      trailing: Container(
                          width: size.width * 0.25,
                          child: chat.allUserNames
                                  .contains(userProvider.allUsers[index].username)
                              ? IconButton(
                                  icon:
                                      Icon(Icons.check_circle_outline_outlined),
                                  onPressed: () => showdialog(index),
                                )
                              : IconButton(
                                  icon: Icon(Icons.circle_outlined),
                                  onPressed: () => showdialog(index),
                                )),
                    ),
                  );
                },
                itemCount: userProvider.allUsers.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
