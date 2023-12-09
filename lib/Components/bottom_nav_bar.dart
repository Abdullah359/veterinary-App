import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vaterinarystore/Pages/Nav_pages/home_page.dart';
import 'package:vaterinarystore/Pages/Nav_pages/logs_page.dart';
import 'package:vaterinarystore/Pages/Nav_pages/pet_info.dart';
import 'package:vaterinarystore/Pages/Nav_pages/schedule_page.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int currentPageIndex = 0;
  static const List<Widget> kPages = [
    HomePage(),
    SchedulePage(),
    LogsPage(),
    PetInfoPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      bottomNavigationBar: Theme(
        data: ThemeData(splashColor: Colors.transparent),
        child: NavigationBar(
          indicatorColor: Colors.transparent,
          indicatorShape: InputBorder.none,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          height: 60,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const [
            NavigationDestination(
                selectedIcon: FaIcon(
                  FontAwesomeIcons.houseMedical,
                  color: Color(0xff22da6e),
                ),
                icon: Icon(
                  FontAwesomeIcons.houseMedical,
                  color: Colors.grey,
                ),
                label: ''),
            NavigationDestination(
                selectedIcon: FaIcon(
                  FontAwesomeIcons.solidCalendar,
                  color: Color(0xff22da6e),
                ),
                icon: Icon(
                  FontAwesomeIcons.solidCalendar,
                  color: Colors.grey,
                ),
                label: ''),
            NavigationDestination(
                selectedIcon: FaIcon(
                  FontAwesomeIcons.fileCircleCheck,
                  color: Color(0xff22da6e),
                ),
                icon: Icon(
                  FontAwesomeIcons.fileCircleCheck,
                  color: Colors.grey,
                ),
                label: ''),
            NavigationDestination(
                selectedIcon: FaIcon(
                  FontAwesomeIcons.paw,
                  color: Color(0xff22da6e),
                ),
                icon: Icon(
                  FontAwesomeIcons.paw,
                  color: Colors.grey,
                ),
                label: ''),
          ],
        ),
      ),
      body: kPages[currentPageIndex],
    ));
  }
}
