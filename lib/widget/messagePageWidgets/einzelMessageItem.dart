import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/domain/chat.dart';
import 'package:messenger/domain/user.dart';

class EinzelMessageItem extends StatelessWidget {
  Chat einzelChat;
  int einzelMessageIndex;
  User currentUser = User("user1", "pass1",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Ocelot_%28Jaguatirica%29_Zoo_Itatiba.jpg/330px-Ocelot_%28Jaguatirica%29_Zoo_Itatiba.jpg");
  double _userPicWidth = 60;

  EinzelMessageItem(this.einzelChat, this.einzelMessageIndex);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool myMsg = einzelChat.allMessages[einzelMessageIndex].user.username ==
        currentUser.username;

    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 10),
      child: myMsg
          ? Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(einzelChat
                              .allMessages[einzelMessageIndex].user.username)),
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
                    margin: EdgeInsets.only(left: 5,),
                    width: _userPicWidth,
                    child: Image.network(
                        einzelChat.allMessages[einzelMessageIndex].user.picurl),
                  ),
                ],
              ),
            )
          : Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: _userPicWidth,
                    margin: EdgeInsets.only(right: 5),
                    child: Image.network(
                        einzelChat.allMessages[einzelMessageIndex].user.picurl),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 5),
                              alignment: Alignment.centerLeft,
                              child: Text(einzelChat
                                  .allMessages[einzelMessageIndex]
                                  .user
                                  .username))
                        ],
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
