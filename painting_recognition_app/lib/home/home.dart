import 'package:flutter/material.dart';
import 'package:painting_recognition_app/message.dart';
import 'package:painting_recognition_app/user/mypage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String finalId;
  late String finalName;
  late String finalEmail;

  @override
  void initState() {
    finalId = "";
    finalName = "";
    finalEmail = "";
    getData();
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const SizedBox(height: 30),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black87), minimumSize: MaterialStateProperty.all(const Size(200, 50))),
              onPressed: () {
                //
              },
              child: const Text('명화 인식', style: TextStyle(fontSize: 25),
              )),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black87), minimumSize: MaterialStateProperty.all(const Size(200, 50))),
              onPressed: () {
                //
              },
              child: const Text('장르 구분', style: TextStyle(fontSize: 25))),
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
                        builder: ((BuildContext context) => const MyPage())));
              },
              leading: const Icon(
                Icons.person,
                // color: Colors.deepPurple,
              ),
              title: const Text('My Page'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/Setting');
              },
              leading: const Icon(
                Icons.settings,
                // color: Colors.deepPurple,
              ),
              title: const Text('설정'),
            ),
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
