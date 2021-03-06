import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/domain/chat.dart';
import 'package:messenger/domain/message.dart';
import 'package:messenger/domain/user.dart';
import 'package:messenger/provider/chatsProvider.dart';
import 'package:messenger/provider/userProvider.dart';
import 'package:provider/provider.dart';

class BottomChatBar extends StatefulWidget {
  var maxWidth;
  Chat einzelChat;
  var maxHeight;

  BottomChatBar(this.maxWidth, this.einzelChat, this.maxHeight);

  @override
  State<BottomChatBar> createState() => _BottomChatBarState();
}

class _BottomChatBarState extends State<BottomChatBar> {
  bool _showEmoji = false;

  @override
  Widget build(BuildContext context) {
    var messageProvider = Provider.of<ChatsProvider>(context);
    var chatController = TextEditingController();
    var textFieldBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 0),
    );
    User currentUser = Provider.of<UserProvider>(context).currentUser;


    return Container(
        height: widget.maxWidth * 0.15,
        padding: EdgeInsets.only(top: 8, bottom: 5),
        decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black.withOpacity(0.1)),
            ),
            color: Colors.grey.withOpacity(0.1)
            /*  boxShadow:[BoxShadow(color: Colors.grey,offset: Offset(0,1))] ,*/
            ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.zero,
              child: IconButton(
                  onPressed: () => print('okkk2'),
                  icon: Icon(
                    Icons.mic,
                    size: 25,
                  )),
            ),
            Container(
              width: widget.maxWidth * 0.63,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: textFieldBorder,
                  focusedBorder: textFieldBorder,
                ),
                controller: chatController,
                onSubmitted: (value) {
                  if(value!=null && !(value.isEmpty)){
                    Provider.of<ChatsProvider>(context,listen: false).addMessageToAChat(new Message(value, DateTime.now(),currentUser.username), widget.einzelChat.chatId);
                  /*  widget.einzelChat.allMessages
                        .add(new Message(value, DateTime.now(),currentUser.username));
                   */
                    chatController.clear();
                  }
                },
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.zero,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _showEmoji ? {_showEmoji = false} : {_showEmoji = true};
                      print(_showEmoji);
                    });
                  },
                  icon: Icon(
                    Icons.emoji_emotions_outlined,
                    size: 25,
                  )),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.zero,
              child: IconButton(
                  onPressed: () => print('okkk2'),
                  icon: Icon(
                    Icons.add_circle_outline_rounded,
                    size: 25,
                  )),
            ),
          ],
        ));
  }
}
