import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/domain/user.dart';

class ProfilePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    User currentUser = User("user3", "pass1",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Ocelot_%28Jaguatirica%29_Zoo_Itatiba.jpg/330px-Ocelot_%28Jaguatirica%29_Zoo_Itatiba.jpg");
    var userNameController = TextEditingController(text: currentUser.username);
    var userPassController = TextEditingController(text: currentUser.password);
    double picSize = size.width * 0.6;

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
                top: size.height * 0.2 - picSize / 2,
                child: Container(
                  width: picSize,
                  height: picSize,
                  child: Image.network(currentUser.picurl),
                ),
              ),
              Positioned(
                top: size.height * 0.37,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1, color: Colors.black.withOpacity(0.5)),
                    ),
                  ),
                  child: Container(
                    width: size.width * 0.5,
                    child: TextFormField(
                      controller: userNameController,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 33),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.47,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1, color: Colors.black.withOpacity(0.5)),
                    ),
                  ),
                  child: Container(
                    width: size.width * 0.5,
                    child: TextFormField(
                      controller: userPassController,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 33),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height*0.62,
                  child: Container(
                    width: size.width*0.4,
                child: ElevatedButton(
                  onPressed: () => print('pressedButton'),
                  child: Text("Change Profile"),
                ),
              ))
            ],
          ),
        ));
  }
}
