import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tasktest/UIScreens/Screen1.dart';
import 'package:tasktest/UIScreens/Screen2.dart';
import 'package:tasktest/UIScreens/Screen3.dart';

class Homepage extends StatefulWidget {

  @override
  _HomepageState createState() => _HomepageState();
}


class _HomepageState extends State<Homepage> {
  late PageController _pageController;

  List<Widget> pages = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];

  late int _selectedPage;






  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    _selectedPage = 0;
    super.initState();
  }








  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              children: pages,
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              // gradient: LinearGradient(
              //     colors: [
              //       const Color(0xFF00a3cc),
              //       const Color(0xFF33d6ff),
              //       const Color(0xFF66e0ff),
              //     ],
              //     begin: const FractionalOffset(0.0, 0.0),
              //     end: const FractionalOffset(1.0, 0.0),
              //     // stops: [0.0, 1.0],
              //     tileMode: TileMode.clamp),
              borderRadius: BorderRadius.all(Radius.circular(18.0),
              ),
            ),
            height: Platform.isAndroid ? 65.0 : 85.0,
            padding: Platform.isIOS
                ? const EdgeInsets.only(bottom: 10)
                : const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _pageController.jumpToPage(0);

                    if (mounted) {
                      setState(() {
                        _selectedPage = 0;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.perm_identity,
                          color: _selectedPage == 0 ? Colors.orange : Colors.white,
                          size: 25.0,
                        ),
                        Text("Profile", style: TextStyle(color: _selectedPage == 0 ? Colors.orange : Colors.white,),)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _pageController.jumpToPage(1);
                    setState(() {
                      _selectedPage = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.home,
                          color:
                              _selectedPage == 1 ? Colors.orange : Colors.white,
                          size: 25.0,
                        ),
                        Text("Home", style: TextStyle(color: _selectedPage == 1 ? Colors.orange : Colors.white,),)

                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _pageController.jumpToPage(3);
                    setState(() {
                      _selectedPage = 3;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.work,
                          color:
                              _selectedPage == 3 ? Colors.orange : Colors.white,
                          size: 25.0,
                        ),
                        Text("Jobs", style: TextStyle(color: _selectedPage == 3 ? Colors.orange : Colors.white,),)

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
