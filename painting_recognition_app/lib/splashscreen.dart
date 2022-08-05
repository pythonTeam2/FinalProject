import 'dart:async';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String? finalId;
  String? finalName;
  String? finalEmail;

  @override
  void initState() {
    getData().whenComplete(() async {
      Timer(
          const Duration(seconds: 2),
          () => Get.to(finalId == ""
              ? Navigator.pushNamed(context, '/sign_in')
              : Navigator.popAndPushNamed(context, '/home')));
    });
    super.initState();
  }

  Future getData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obitainedId = sharedPreferences.getString('id');
    var obitainedName = sharedPreferences.getString('name');
    var obitainedEmail = sharedPreferences.getString('email');

    setState(() {
      if (obitainedId == null) {
        finalId = "";
      } else {
        finalId = obitainedId;
        finalName = obitainedName;
        finalEmail = obitainedEmail;
      }
    });
    // print("로딩 : $finalId");
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('images/korea.png'),
      title: const Text(
        '이미지 파일로 명화를 인식해보세요!',
        style: TextStyle(
          backgroundColor: Colors.black38,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundImage: const AssetImage('images/pearly.png'),
      showLoader: true,
      loadingText: const Text(
        "Loading...",
        style: TextStyle(
          backgroundColor: Colors.black38,
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      loaderColor: Colors.black,
      logoSize: 165,
      loadingTextPadding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
    );
  }
}
