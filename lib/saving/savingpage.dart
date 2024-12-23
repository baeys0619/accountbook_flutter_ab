import 'package:accountbook/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:accountbook/saving/abstinence.dart';
import 'package:accountbook/saving/saving_list.dart';


class savingPage extends StatelessWidget {
  const savingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.monetization_on_outlined),
            actions: [
              IconButton(
                onPressed: () {
                  print('shopping cart button is clicked');
                },
                icon: Icon(Icons.shopping_cart),
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(50, 18, 151, 200),
                child: Text(
                  '이달의 절제 금액',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 200),
                    ElevatedButton(
                        onPressed: () {
                          print('버튼 클림됨');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const abstinence()));
                        },
                        child: Text('안 쓰고 참은 돈 기록하기',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(257, 50),
                          backgroundColor: ThemeColors.blue2,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        print('안 쓰고 참은 돈 내역 보기 버튼 클릭됨');
                        SavingList.showSavingListBottomSheet(context); //saving_list.dart의 바텀시트 호출
                      },
                      child: Text(
                        '안 쓰고 참은 돈 내역보기',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(257, 50),
                          backgroundColor: ThemeColors.blue2,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
