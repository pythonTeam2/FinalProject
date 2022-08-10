import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting_recognition_app/genre/genre.dart';
import 'package:painting_recognition_app/home/home.dart';
import 'package:painting_recognition_app/painting/painting.dart';
import 'package:painting_recognition_app/splashscreen.dart';
import 'package:painting_recognition_app/user/findMain.dart';
import 'package:painting_recognition_app/user/findMain2.dart';
import 'package:painting_recognition_app/user/mypage.dart';
import 'package:painting_recognition_app/user/sign_in.dart';
import 'package:painting_recognition_app/user/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // debug banner false
      debugShowCheckedModeBanner: false,
      routes: {
        // loading
        '/loading': (context) => const SplashPage(),

        // home
        '/home': (context) => const Home(),

        // user part
        '/sign_in': (context) => const LogIn(),
        '/sign_up': (context) => const SignUp(),
        '/find_id': (context) => const FindMain(), // 탭바 연결, id 기준
        '/find_pw': (context) => const FindMain2(), // 탭바 연결, pw 기준
        '/mypage': (context) => const MyPage(),

        // painting part
        '/painting' :(context) => const Painting(),

        // genre part
        '/genre': (context) => const Genre(),
      },
      initialRoute: '/loading',
    );
  }
}
