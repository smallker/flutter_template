import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/widget/pixel.dart';
import 'package:flutter_template/views/menu/home_page.dart';
import 'package:flutter_template/views/menu/more_page.dart';
import 'package:flutter_template/views/menu/note_page.dart';
import 'package:flutter_template/views/menu/notify_page.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'login_page.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  PersistentTabController controller;
  List<PersistentBottomNavBarItem> navBarItem = [
    PersistentBottomNavBarItem(
        icon: Icon(Icons.home), title: 'Home', activeColor: Colors.orange),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.event_note),
        title: 'Note',
        activeColor: Colors.orange),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.notifications),
        title: 'Notification',
        activeColor: Colors.orange),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.more_horiz),
        title: 'More',
        activeColor: Colors.orange),
  ];
  @override
  Widget build(BuildContext context) {
    Pixel().init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        child: SafeArea(
          child: PersistentTabView(
            controller: controller,
            screens: [HomePage(), NotePage(), NotifyPage(), MorePage()],
            items: navBarItem,
            confineInSafeArea: true,
            backgroundColor: Colors.white,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            itemAnimationProperties: ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style1,
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.pages),
              onPressed: () => Get.to(LoginPage()),
            ),
          ),
        ),
      ),
    );
  }
}
