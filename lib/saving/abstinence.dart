import 'package:flutter/material.dart';
import 'package:accountbook/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:accountbook/saving/firestore_page.dart';

class abstinence extends StatelessWidget {
  const abstinence({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.keyboard_backspace_rounded)),
            title: Text('기록하기', style: TextStyle(fontSize: 15)),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FirestorePage()));
                  },
                  child: Text(
                    '완료',
                    style: TextStyle(color: ThemeColors.blue2, fontSize: 14),
                  ))
            ],
          ),
          body: writing(),
        );
      },
    );
  }
}

class writing extends StatefulWidget {
  const writing({super.key});

  @override
  State<writing> createState() => _writingState();
}

class _writingState extends State<writing> {
  TextEditingController inputController = TextEditingController();
  String inputText = '';

  TextEditingController keywordController = TextEditingController();
  String keyword = '';

  TextEditingController situationController = TextEditingController();
  String situation = '';

  @override
  void dispose() {
    inputController.dispose();
    keywordController.dispose();
    situationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(inputText),
              Padding(
                padding: const EdgeInsets.fromLTRB(29, 0, 29, 6),
                child: TextField(
                  controller: inputController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: ThemeColors.blue3,
                      hintText: '안 쓰고 참은 금액을 입력해주세요',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none)),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(29, 6, 29, 33),
                  child: TextField(
                    controller: keywordController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: ThemeColors.blue3,
                        hintText: '키워드를 설정해주세요',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
              ),
              Container(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(29, 33, 29, 265),
                child: TextField(
                  controller: situationController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: ThemeColors.blue3,
                      hintText: '어떤 상황이었는지 설명해주세요',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

//abstinence.dart file
