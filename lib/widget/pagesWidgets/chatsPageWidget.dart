import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messenger/domain/user.dart';
import 'package:messenger/page/messagesPage.dart';
import 'package:messenger/provider/chatsProvider.dart';
import 'package:messenger/provider/userProvider.dart';
import 'package:messenger/widget/chatsPageWidgets/topBar.dart';
import 'package:provider/provider.dart';

class ChatsPageWidget extends StatefulWidget {
  @override
  State<ChatsPageWidget> createState() => _ChatsPageWidgetState();
}

class _ChatsPageWidgetState extends State<ChatsPageWidget> {
  @override
  Widget build(BuildContext context) {
    var chatsProvider = Provider.of<ChatsProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    User currentUser = userProvider.currentUser;
    var loading = false;

     Future<void> refreshingData() async {
      setState(() {
        loading = true;
      });
      await Provider.of<ChatsProvider>(context, listen: false).loadAllChats();
      setState(() {
        loading = false;
      });
      Timer.periodic(Duration(seconds: 1), (timer) {
        print(DateTime.now());
      });

    }



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24.withOpacity(0.8),
        title: Text("Chats"),
        actions: [TopBar()],
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
            onRefresh: () {
              print('refreshing');
              return refreshingData();
            },
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return ListView(
                    children: chatsProvider.allChats
                        .where((element) =>
                            element.allUserNames.contains(currentUser.username))
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
                          leading: Container(
                              width: 80, child: Image.network(e.picUrl)),
                          title: Text(
                            e.chatName,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          subtitle: e.allMessages.last.content.length < 18
                              ? Text(e.allMessages.last.content)
                              : Text(
                                  e.allMessages.last.content.substring(0, 18) +
                                      " ..."),
                          trailing: Text(DateFormat('dd/MM')
                              .format(e.allMessages.last.dateTime)),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
          ),
    );
  }
}
