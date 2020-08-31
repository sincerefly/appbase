import 'package:flutter/material.dart';

class WidgetPage extends StatefulWidget {
  @override
  SecondPageState createState() => new SecondPageState();
}

class SecondPageState extends State<WidgetPage>
    with AutomaticKeepAliveClientMixin {
  SecondPageState() : super();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Text("widget page"),
    );
  }
}
