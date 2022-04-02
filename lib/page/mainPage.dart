import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messenger/provider/chatsProvider.dart';
import 'package:messenger/provider/pageProvider.dart';
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



  @override
  Widget build(BuildContext context) {
    var pageProvider=Provider.of<PageProvider>(context);
    int _selectedPageIndex = Provider.of<PageProvider>(context).pageIndex;

  var chatsProvider = Provider.of<ChatsProvider>(context);
    return Scaffold(
      body: pageProvider.getPageViaIndex(_selectedPageIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'All Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_sharp),label: 'Profile'),
        ],
        currentIndex: _selectedPageIndex,
        onTap: (value){
            pageProvider.setPageIndex(value);
        },
      ),
    );
  }
}
