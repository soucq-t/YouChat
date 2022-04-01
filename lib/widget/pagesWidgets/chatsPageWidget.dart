import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messenger/page/messagesPage.dart';
import 'package:messenger/provider/chatsProvider.dart';
import 'package:messenger/widget/chatsPageWidgets/topBar.dart';
import 'package:provider/provider.dart';

class ChatsPageWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var chatsProvider = Provider.of<ChatsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        actions: [TopBar()],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ListView(
            children: chatsProvider.allChats.map((e) {
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
                  leading: Image.network(
                     "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Latin_dictionary.jpg/413px-Latin_dictionary.jpg"),
                  title: Text(e.chatName),
                  subtitle: Text(e.allMessages.last.content),
                  trailing: Text(DateFormat('dd/MM/yyyy').format(e.allMessages.last.dateTime)),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
