import 'package:flutter/material.dart';
import 'package:messenger/page/chatDetail.dart';
import 'package:messenger/page/loginPage.dart';
import 'package:messenger/page/mainPage.dart';
import 'package:messenger/page/messagesPage.dart';
import 'package:messenger/provider/chatsProvider.dart';
import 'package:messenger/provider/pageProvider.dart';
import 'package:messenger/provider/userProvider.dart';
import 'package:messenger/widget/pagesWidgets/profilePageWidget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatsProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => PageProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          backgroundColor: Colors.white

        ),
        initialRoute: LoginPage.route,
        routes: {
          MainPage.route: (_) => MainPage(),
          MessagePage.route: (_) => MessagePage(),
          LoginPage.route: (_) => LoginPage(),
          ChatDetail.route:(_) => ChatDetail(),
        },
      ),
    );
  }
}
