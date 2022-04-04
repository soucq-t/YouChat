import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messenger/domain/user.dart';
import 'package:messenger/page/messagesPage.dart';
import 'package:messenger/provider/chatsProvider.dart';
import 'package:messenger/provider/userProvider.dart';
import 'package:messenger/widget/chatsPageWidgets/topBar.dart';
import 'package:provider/provider.dart';

class ChatsPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var chatsProvider = Provider.of<ChatsProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    User currentUser = userProvider.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24.withOpacity(0.8),
        title: Text("Chats"),
        actions: [TopBar()],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ListView(
            children: chatsProvider.allChats
                .where(
                    (element) => element.allUsers.contains(currentUser))
                .map((e) {
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 0.1),
                  ),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  onTap: () => Navigator.of(context)
                      .pushNamed(MessagePage.route, arguments: e),
                  leading: Container(width: 80, child: Image.network(e.picUrl)),
                  title: Text(
                    e.chatName,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  subtitle: e.allMessages.last.content.length < 18
                      ? Text(e.allMessages.last.content)
                      : Text(
                          e.allMessages.last.content.substring(0, 18) + " ..."),
                  trailing: Text(
                      DateFormat('dd/MM').format(e.allMessages.last.dateTime)),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
