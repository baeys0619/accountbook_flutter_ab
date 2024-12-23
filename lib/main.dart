import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:accountbook/theme/colors.dart';
import 'package:accountbook/mainpage/Mainpage_bottom.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //이거 안 하면 에러 생김
  var firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const accountbook());
}

class accountbook extends StatelessWidget {
  const accountbook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainpageBottom(),
    );
  }
}
