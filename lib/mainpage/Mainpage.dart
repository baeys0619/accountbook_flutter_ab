import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:accountbook/theme/colors.dart';



class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //반응형 레이아웃
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Scaffold(
          body: Column(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(50, 122, 136, 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 51,
                    width: 200,
                    child: Text('오늘의 소비 한도',
                    style: TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 24
                    ),),
                  )
                ],
              ),)
            ],
          ),
        );
      },
    );
  }
}

