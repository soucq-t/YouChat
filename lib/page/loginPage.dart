import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/page/mainPage.dart';
import 'package:messenger/provider/pageProvider.dart';
import 'package:messenger/provider/userProvider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static var route = 'login-page';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var userNameController = TextEditingController(text: "user1");
    userNameController.selection = TextSelection.fromPosition(
        TextPosition(offset: userNameController.text.length));
    var userPassController = TextEditingController(text: "pass1");
    userPassController.selection = TextSelection.fromPosition(
        TextPosition(offset: userPassController.text.length));

    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
        body: Container(
      width: screenSize.width,
      height: screenSize.height,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          /* Positioned(
            top: screenSize.height * 0.8,
            width: screenSize.width * 0.7,
            child: TextFormField(
              controller: userPassController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some Text';
                }
                return null;
              },
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
          ),

          */

          Positioned(
              top: screenSize.height * 0.05,
              left: screenSize.width / 2 - screenSize.width * 0.9 / 2 - 50,
              child: Container(
                width: screenSize.width * 1,
                child: Image.network(
                    "https://thumbs.gfycat.com/AnotherSimilarHoiho-max-1mb.gif"),
              )),
          Positioned(
            top: screenSize.height * 0.38,
            child: Container(
              padding: EdgeInsets.only(bottom: 5),
              width: screenSize.width * 0.7,
              alignment: Alignment.center,
              child: Text(
                "YouChat",
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.445,
            child: Container(
              padding: EdgeInsets.only(bottom: 5),
              width: screenSize.width * 0.7,
              alignment: Alignment.center,
              child: Text(
                "Take your time dumb !",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.51, //0.51
            child: Container(
              width: screenSize.width * 0.7,
              child: TextField(
                cursorColor: Colors.black,
                controller: userNameController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.6, //0.51
            width: screenSize.width * 0.7,
            child: TextField(
              cursorColor: Colors.black,
              controller: userPassController,
              obscureText: true,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.8,
            child: Container(
              width: screenSize.width * 0.65,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black87),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 33),
                  ),
                ),
                onPressed: () {
                  if (userProvider.validUser(
                      userNameController.text, userPassController.text)) {
                    print('ok');
                    Provider.of<PageProvider>(context,listen: false).setPageIndex(0);
                    Navigator.of(context).popAndPushNamed(MainPage.route);
                  } else {
                    print('not');
                  }
                  ;
                },
              ),
            ),
          ),

        ],
      ),
    ));
  }
}
