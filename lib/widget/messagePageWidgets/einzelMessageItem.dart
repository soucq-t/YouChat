import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messenger/domain/chat.dart';
import 'package:messenger/domain/user.dart';
import 'package:messenger/provider/userProvider.dart';
import 'package:provider/provider.dart';

class EinzelMessageItem extends StatelessWidget {
  Chat einzelChat;
  int einzelMessageIndex;
  double _userPicWidth = 60;

  EinzelMessageItem(this.einzelChat, this.einzelMessageIndex);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    User currentUser = Provider.of<UserProvider>(context).currentUser;
    var size = MediaQuery.of(context).size;
    bool myMsg = einzelChat.allMessages[einzelMessageIndex].username ==
        currentUser.username;

    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 10),
      child: myMsg
          ? GestureDetector(
              onLongPressStart: (details) {
                print(userProvider.allUsers
                    .where((element) =>
                element.username ==
                    einzelChat.allMessages[einzelMessageIndex].username)
                    .map((e) => e.picurl)
                    .toString().split('(')[1].split(')')[0]);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5, right: 15),
                              child: Text(DateFormat("HH:mm").format(einzelChat
                                  .allMessages[einzelMessageIndex].dateTime)),
                            ),
                            Container(
                                padding: EdgeInsets.only(bottom: 5),
                                alignment: Alignment.centerLeft,
                                child: Text(einzelChat
                                    .allMessages[einzelMessageIndex].username)),
                          ],
                        ),
                      ),
                      Container(
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: size.width * 0.7),
                          child: BubbleSpecialOne(
                            color: Colors.white,
                            isSender: true,
                            text: einzelChat
                                .allMessages[einzelMessageIndex].content,
                            textStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 5,
                    ),
                    width: _userPicWidth,
                    child: Image.network(userProvider.allUsers
                        .where((element) =>
                    element.username ==
                        einzelChat.allMessages[einzelMessageIndex].username)
                        .map((e) => e.picurl)
                        .toString().split('(')[1].split(')')[0]),
                  ),
                ],
              ),
            )
          : GestureDetector(
              onLongPressStart: (details) {
                showMenu(
                    context: context,
                    position: RelativeRect.fromSize(
                        Rect.fromLTWH(details.globalPosition.dx,
                            details.globalPosition.dy, 0, 0),
                        MediaQuery.of(context).size),
                    items: [
                      PopupMenuItem(
                        child: Container(
                          child: Text(DateFormat("HH:mm dd.MM").format(
                              einzelChat
                                  .allMessages[einzelMessageIndex].dateTime)),
                        ),
                      ),
                    ]);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: _userPicWidth,
                    margin: EdgeInsets.only(right: 5),
                    child: Image.network(userProvider.allUsers
                        .where((element) =>
                    element.username ==
                        einzelChat.allMessages[einzelMessageIndex].username)
                        .map((e) => e.picurl)
                        .toString().split('(')[1].split(')')[0]),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: EdgeInsets.only(bottom: 5),
                                alignment: Alignment.centerLeft,
                                child: Text(einzelChat
                                    .allMessages[einzelMessageIndex]

                                    .username)),
                            Container(
                              margin: EdgeInsets.only(bottom: 5, left: 15),
                              child: Text(DateFormat("HH:mm").format(einzelChat
                                  .allMessages[einzelMessageIndex].dateTime)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: size.width * 0.7),
                        child: BubbleSpecialOne(
                          color: Colors.white,
                          isSender: false,
                          text: einzelChat
                              .allMessages[einzelMessageIndex].content,
                          textStyle: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
