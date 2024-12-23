import 'package:flutter/material.dart';
import 'package:accountbook/mainpage/Mainpage.dart';
import 'package:accountbook/saving/savingpage.dart';

class MainpageBottom extends StatefulWidget {
  const MainpageBottom({super.key});

  @override
  State<MainpageBottom> createState() => _MainpageBottomState();
}

class _MainpageBottomState extends State<MainpageBottom> {
  int myIndex = 0;
  List<Widget> widgetList = const [
    Mainpage(),
    savingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
            onTap: (index){
              setState(() {
                myIndex = index;
              });
            },
            currentIndex: myIndex,
            items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.savings_rounded), label: 'saving')
        ]),
      ),
    );
  }
}
