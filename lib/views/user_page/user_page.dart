import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  // final UserInformation userInfo;
  // UserPage({Key key, this.userInfo}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    // print(widget.userInfo);
    return Scaffold(
      body: Container(
        // child: DrawerPage(
        //   userInfo: widget.userInfo,
        // ),
        child: Text("user page"),
      ),
    );
  }
}
