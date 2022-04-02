
import 'package:flutter/cupertino.dart';
import 'package:messenger/widget/pagesWidgets/chatsPageWidget.dart';
import 'package:messenger/widget/pagesWidgets/profilePageWidget.dart';

class PageProvider with ChangeNotifier{
  int _pageIndex=0;

  int get pageIndex => _pageIndex;

  Widget getPageViaIndex(int pageIndex){
    print(pageIndex);
    switch(pageIndex){
      case 0:return ChatsPageWidget();
      case 1:return ProfilePageWidget();
    }
    return ChatsPageWidget();
  }
  void setPageIndex(int pageIndex){
    _pageIndex=pageIndex;
    notifyListeners();
  }
}