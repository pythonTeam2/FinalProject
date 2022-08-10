import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:painting_recognition_app/message.dart';
import 'package:painting_recognition_app/user/mypage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String finalId;
  late String finalName;
  late String finalEmail;

  // DB
  late List data;
  late String result;

  @override
  void initState() {
    super.initState();
    finalId = "";
    finalName = "";
    finalEmail = "";
    data = [];
    getData();
  }

  Future getData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obitainedid = sharedPreferences.getString('id');
    var obitainedEmail = sharedPreferences.getString('email');
    var obitainedName = sharedPreferences.getString('name');

    setState(() {
      if (obitainedid == null) {
        finalId = "";
      } else {
        finalId = obitainedid;
        finalEmail = obitainedEmail!;
        finalName = obitainedName!;
      }
    });
    Message.uId = finalId;
    Message.uEmail = finalEmail;
    Message.uName = finalName;
  }

  Future getJSONData() async {
    data.clear();
    var url = Uri.parse(
        "http://localhost:8080/Flutter/fitness/mypage_select.jsp?uId=$finalId");
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      //키값
      List value = dataConvertedJSON['results'];
      //데이터에 넣기
      data.addAll(value);
      // 변수에 저장
      Message.uId = data[0]['uId'];
      Message.uPw = data[0]['uPw'];
      Message.uName = data[0]['uName'];
      Message.uBirth = data[0]['uBirth'].toString();
      Message.uEmail = data[0]['uEmail'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 30),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black87),
                  minimumSize: MaterialStateProperty.all(const Size(200, 50))),
              onPressed: () {
                //
              },
              child: const Text(
                '명화 인식',
                style: TextStyle(fontSize: 25),
              )),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 300,
              color: Colors.black12,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '명작 50선 중에 하나를 촬영 및 업로드하시면, \n인공지능이 그 그림의 정보를 알려드립니다.',
                  style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic, height: 1.5),
                ),
              ),
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                  minimumSize: MaterialStateProperty.all(const Size(200, 50))),
              onPressed: () {
                Navigator.pushNamed(context, '/painting');
              },
              child: const Text(
                '명화 인식 해보자구!',
                style: TextStyle(fontSize: 15),
              )),
          const SizedBox(height: 30),
          const Divider(endIndent: 1, color: Colors.black45,),
          const SizedBox(height: 30),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black87),
                  minimumSize: MaterialStateProperty.all(const Size(200, 50))),
              onPressed: () {
                //
              },
              child: const Text('장르 구분', style: TextStyle(fontSize: 25))),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 300,
              color: Colors.black12,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '정물화, 풍경화, 초상화 중에 하나를 촬영 및 업로드하시면, 인공지능이 셋 중에 어떤 장르인지 맞춥니다.',
                  style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic, height: 1.5),
                ),
              ),
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                  minimumSize: MaterialStateProperty.all(const Size(200, 50))),
              onPressed: () {
                Navigator.pushNamed(context, '/genre');
              },
              child: const Text(
                '장르 구분 해보자구!',
                style: TextStyle(fontSize: 15),
              )),
        ]),
      ),
      drawer: Drawer(
        child: ListView(
          //패딩 없이 꽉 채우기
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              //상단에 이미지 넣기
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage(
                  'images/korea.png',
                ),
              ),
              //이미지 밑에 이름 & 이메일
              accountName: Text('${Message.uName}님'),
              accountEmail: Text(Message.uEmail),
              decoration: const BoxDecoration(
                color: Colors.black87,
                //테두리, 값을 각각 줄 수 있음. all 은 한번에 다 뜸
              ),
            ),
            // 리스트
            ListTile(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const MyPage()))
                    .then((value) =>
                        getJSONData().then((value) => print(Message.uEmail)));
              },
              leading: const Icon(
                Icons.person,
                // color: Colors.deepPurple,
              ),
              title: const Text('My Page'),
            ),
            // ListTile(
            //   onTap: () {
            //     Navigator.pushNamed(context, '/setting');
            //   },
            //   leading: const Icon(
            //     Icons.settings,
            //     // color: Colors.deepPurple,
            //   ),
            //   title: const Text('설정'),
            // ),
            ListTile(
              onTap: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove("id");
                // handleSignOut();
                Navigator.popUntil(context, (route) => false);
                Navigator.pushNamed(context, '/sign_in');
              },
              leading: const Icon(
                Icons.logout,
                // color: Colors.deepPurple,
              ),
              title: const Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
