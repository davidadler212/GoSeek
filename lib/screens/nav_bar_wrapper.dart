import 'package:events_app/screens/navbar_pages/create_event.dart';
import 'package:events_app/screens/navbar_pages/events/events.dart';
import 'package:events_app/screens/navbar_pages/home.dart';
import 'package:events_app/screens/navbar_pages/your_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:events_app/screens/navbar_pages/chat/messages.dart';

class NavBarWrapper extends StatefulWidget {
  const NavBarWrapper({Key? key}) : super(key: key);

  @override
  _NavBarWrapperState createState() => _NavBarWrapperState();
}

class _NavBarWrapperState extends State<NavBarWrapper> {
  int _bottomNavBarIndex = 0;

  final List<Widget> _bottomNavBarPages = [
    const Home(),
    const Events(),
    const ChatPage(),
    const YourProfile(),
  ];

  setBottomNavBarIndex(index) {
    setState(() {
      _bottomNavBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _bottomNavBarPages[_bottomNavBarIndex],
      bottomNavigationBar: Container(
        width: screenWidth,
        height: 78.0,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(250, 250, 250, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              blurRadius: 40,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: 0,
              ),
              IconButton(
                padding: const EdgeInsets.only(right: 15.0),
                icon: Icon(
                  _bottomNavBarIndex == 0
                      ? CupertinoIcons.house_fill
                      : CupertinoIcons.house,
                  color: const Color.fromRGBO(40, 40, 40, 1),
                  size: 30.0,
                ),
                onPressed: () {
                  setBottomNavBarIndex(0);
                },
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      _bottomNavBarIndex == 1
                          ? CupertinoIcons.ticket_fill
                          : CupertinoIcons.ticket,
                      size: 30.0,
                      color: const Color.fromRGBO(40, 40, 40, 1),
                    ),
                    onPressed: () {
                      setBottomNavBarIndex(1);
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9.0),
                child: ScaleTap(
                  child: const Icon(
                    CupertinoIcons.plus_rectangle_fill,
                    color: Color(0xFF106BAD),
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        fullscreenDialog: true,
                        builder: (context) {
                          return const CreateEvent();
                        },
                      ),
                    );
                  },
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    // padding: const EdgeInsets.only(left: 15.0),
                    icon: Icon(
                      _bottomNavBarIndex == 2
                          ? CupertinoIcons.chat_bubble_fill
                          : CupertinoIcons.chat_bubble,
                      size: 30.0,
                      color: const Color.fromRGBO(40, 40, 40, 1),
                    ),
                    onPressed: () {
                      setBottomNavBarIndex(2);
                    },
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    // padding: const EdgeInsets.only(left: 15.0),
                    icon: Icon(
                      _bottomNavBarIndex == 3
                          ? CupertinoIcons.person_fill
                          : CupertinoIcons.person,
                      size: 30.0,
                      color: const Color.fromRGBO(40, 40, 40, 1),
                    ),
                    onPressed: () {
                      setBottomNavBarIndex(3);
                    },
                  ),
                ],
              ),
              const SizedBox(
                width: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
