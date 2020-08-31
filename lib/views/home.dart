import 'package:flutter/material.dart';
import 'package:appbase/views/first_page/first_page.dart';
import 'package:appbase/views/widget_page/widget_page.dart';
import 'package:appbase/views/user_page/user_page.dart';

class AppPage extends StatefulWidget {
  // final UserInformation userInfo;
  // AppPage(this.userInfo);

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<AppPage>
    with SingleTickerProviderStateMixin {
  bool isSearch = false;

  List<Widget> _list = List();
  int _currentIndex = 0;
  List tabData = [
    {'text': '首页', 'icon': Icon(Icons.home)},
    {'text': 'WIDGET', 'icon': Icon(Icons.extension)},
    {'text': '个人中心', 'icon': Icon(Icons.account_circle)},
    // https://material.io/resources/icons/?style=baseline
  ];
  List<BottomNavigationBarItem> _myTabs = [];
  String appBarTitle;

  @override
  void initState() {
    super.initState();
    // print('widget.userInfo    ${widget.userInfo}');

    for (int i = 0; i < tabData.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          tabData[i]['text'],
        ),
      ));
    }
    _list
      ..add(FirstPage())
      ..add(WidgetPage())
      // ..add(UserPage(userInfo: widget.userInfo));
      ..add(UserPage());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // 使用 IndexedStack 来保持页面切换时的状态
      body: IndexedStack(
        index: _currentIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _myTabs,
        currentIndex: _currentIndex,
        onTap: _itemTapped,
        type: BottomNavigationBarType.fixed,
        fixedColor: Theme.of(context).primaryColor,
      ),
    );
  }

  void _itemTapped(int index) {
    setState(() {
      _currentIndex = index;
      appBarTitle = tabData[index]['text'];
    });
  }
}
