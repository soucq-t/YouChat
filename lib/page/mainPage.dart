import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messenger/provider/chatsProvider.dart';
import 'package:messenger/widget/pagesWidgets/chatsPageWidget.dart';
import 'package:messenger/widget/pagesWidgets/profilePageWidget.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  static var route = 'main-page';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final double popupItemSize = 150;

  int _selectedPageIndex = 0;

  Widget getPageViaIndex(int pageIndex){
    print(pageIndex);
    switch(pageIndex){
      case 0:return ChatsPageWidget();
      case 1:return ProfilePageWidget();
    }
    return ChatsPageWidget();
  }

  @override
  Widget build(BuildContext context) {
    var chatsProvider = Provider.of<ChatsProvider>(context);
    return Scaffold(
      body: getPageViaIndex(_selectedPageIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'All Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_sharp),label: 'Profile'),
        ],
        currentIndex: _selectedPageIndex,
        onTap: (value){
          setState(() {
            _selectedPageIndex=value;
          });
        },
      ),
    );
  }
}
