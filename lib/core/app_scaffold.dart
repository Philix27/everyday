import 'package:everyday/view/order/orders_page.dart';
import 'package:everyday/view/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/view/article/index.dart';
import 'package:everyday/view/cart/cart_page.dart';
import 'package:everyday/view/home/home.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({Key? key}) : super(key: key);

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      // navBarHeight: 35,
      backgroundColor: Styles.backgroundColor!,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Styles.backgroundColor!,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200), curve: Curves.ease),
      screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200)),
      navBarStyle: NavBarStyle.style1,
    );
  }
}

List<Widget> _buildScreens() => [
      HomePage(),
      const CartPage(),
      const OrdersPage(),
      const ProfilePage(),
    ];

List<PersistentBottomNavBarItem> _navBarsItems() {
  return <PersistentBottomNavBarItem>[
    item(CupertinoIcons.home, ("Home")),
    item(CupertinoIcons.shopping_cart, ("Cart")),
    item(Icons.receipt, ("Orders")),
    item(CupertinoIcons.settings, ("Settings")),

    // item(Icons.bookmark, ("Bookmark")),
  ];
}

PersistentBottomNavBarItem item(IconData icon, String title) =>
    PersistentBottomNavBarItem(
      icon: Icon(icon, color: Styles.primaryColorLight!, size: 14),
      inactiveIcon: Icon(icon, color: CupertinoColors.systemGrey, size: 12.5),
      title: title,
      activeColorPrimary: Styles.primaryColor!,
      inactiveColorPrimary: CupertinoColors.systemGrey,
      activeColorSecondary: Styles.primaryColor!,
      inactiveColorSecondary: CupertinoColors.systemGrey,
      textStyle: Styles.bodyText2,
    );
