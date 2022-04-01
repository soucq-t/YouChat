import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final double popupItemSize = 150;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () => print('loop'), icon: Icon(Icons.search)),
        PopupMenuButton(
          icon: Icon(Icons.add_circle),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Container(
                width: popupItemSize,
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Add Freind"),
                  ],
                ),
              ),
              onTap: () => print('AddFreinds'),
            ),
            PopupMenuItem(
              child: Container(
                width: popupItemSize,
                child: Row(
                  children: [
                    Icon(
                      Icons.group_add,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Add Group Chat"),
                  ],
                ),
              ),
              onTap: () => print('AddGroups'),
            ),
          ],
        )
      ],
    );
  }
}
