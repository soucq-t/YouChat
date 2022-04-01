import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/provider/userProvider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static var route = 'login-page';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var _formKey = GlobalKey<FormState>();
    var userNameController = TextEditingController();
    var userPassController = TextEditingController();
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
        body: Container(
      width: screenSize.width,
      height: screenSize.height,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
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
            top: screenSize.height * 0.51,
            child: Container(
              width: screenSize.width * 0.7,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      width: screenSize.width * 0.7,
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        controller: userNameController,
                        style: TextStyle(fontSize: 20),
                        onSaved: (_)=> print('ok'),
                        decoration: InputDecoration(
                          labelText: "Username",
                        ),
                      ),
                    ),
                    Container(
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
                  ],
                ),
              ),
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
                  userProvider.validUser(userNameController.text, userPassController.text);
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
