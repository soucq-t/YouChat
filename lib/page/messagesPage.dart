import 'dart:math';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messenger/domain/chat.dart';
import 'package:messenger/domain/message.dart';
import 'package:messenger/page/chatDetail.dart';
import 'package:messenger/provider/chatsProvider.dart';
import 'package:messenger/widget/messagePageWidgets/bottomChatBar.dart';
import 'package:messenger/widget/messagePageWidgets/einzelMessageItem.dart';
import 'package:provider/provider.dart';

class MessagePage extends StatelessWidget {
  static var route = 'messages-page';
  @override
  Widget build(BuildContext context) {
    var chat = ModalRoute.of(context)?.settings.arguments as Chat;
    var size= MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text(chat.chatName)),
        actions: [
          IconButton(
            onPressed: () =>Navigator.of(context).pushNamed(ChatDetail.route,arguments: chat),
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(children: [
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: constraints.maxHeight * 0.92,
                  ),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return EinzelMessageItem(chat, index,);
                    },
                    itemCount: chat.allMessages.length,
                  ),
                ),
              ),

            ]);
          },
        ),
      ),
      bottomSheet:BottomChatBar(size.width, chat, size.height),
    );
  }
}
