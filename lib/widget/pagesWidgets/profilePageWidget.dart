import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/domain/user.dart';
import 'package:messenger/page/loginPage.dart';
import 'package:messenger/provider/userProvider.dart';
import 'package:provider/provider.dart';

class ProfilePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    User currentUser = Provider.of<UserProvider>(context).currentUser;
    var userNameController = TextEditingController(text: currentUser.username);
    var userPassController = TextEditingController(text: currentUser.password);
    double picSize = size.width * 0.5;

    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                top: size.height * 0.15 - picSize / 2,
                child: Container(
                  width: picSize,
                  height: picSize,
                  child: Image.network(currentUser.picurl),
                ),
              ),
              Positioned(
                top: size.height * 0.33,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1, color: Colors.black.withOpacity(0.2)),
                    ),
                  ),
                  child: Container(
                    width: size.width * 0.6,
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                      controller: userNameController,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.42,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1, color: Colors.black.withOpacity(0.2)),
                    ),
                  ),
                  child: Container(
                    width: size.width * 0.6,
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                      controller: userPassController,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: size.height * 0.57,
                  child: Container(
                    width: size.width * 0.4,
                    child: ElevatedButton(
                      onPressed: () => print('pressedButton'),
                      child: Text("Change Profile"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black87),
                      ),
                    ),
                  )),
              Positioned(
                  top: size.height * 0.7,
                  right: size.width * 0.08,
                  child: Container(
                    width: size.width * 0.25,
                    child: ElevatedButton(
                      child: Text("Log out"),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Log out'),
                              content: Text('Do you really wanna log out?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(context);
                                    Navigator.of(context)
                                        .popAndPushNamed(LoginPage.route);
                                  },
                                  child: Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('No'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
