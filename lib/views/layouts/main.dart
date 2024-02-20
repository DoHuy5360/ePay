import 'package:epay/views/home.dart';
import 'package:epay/views/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  String title = "Home";
  Widget currentView = const HomeView();
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Theme.of(context).colorScheme.secondary,
    // ));
    List<NavigateItem> bottomRoutes = [
      NavigateItem(
          icon: const Icon(Icons.home_outlined),
          label: 'Home',
          action: () {
            setState(() {
              currentView = const HomeView();
              currentViewIndex = 0;
              title = "Home";
            });
          }),
      NavigateItem(
          icon: const Icon(Icons.person_outline),
          label: "User",
          action: () {
            setState(() {
              currentView = const UserView();
              currentViewIndex = 1;
              title = "User";
            });
          }),
      NavigateItem(
          icon: const Icon(Icons.notifications_outlined),
          label: "Notification",
          action: () {}),
      NavigateItem(
          icon: const Icon(Icons.format_list_bulleted),
          label: "More",
          action: () {}),
    ];

    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   title: Text(title),
          //   backgroundColor: Colors.blue[400],
          //   leading: const Icon(Icons.account_balance),
          // ),
          body: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(child: currentView),
          ),
          bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.black,
              selectedItemColor: Theme.of(context).colorScheme.secondary,
              currentIndex: currentViewIndex,
              backgroundColor: Theme.of(context).colorScheme.primary,
              onTap: (int index) {
                bottomRoutes[index].action();
              },
              items: bottomRoutes
                  .map((e) =>
                      BottomNavigationBarItem(icon: e.icon, label: e.label))
                  .toList())),
    );
  }
}

class NavigateItem {
  Icon icon;
  String label;
  Function action;
  NavigateItem({required this.icon, required this.label, required this.action});
}
