import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:painting_recognition_app/message.dart';
import 'package:painting_recognition_app/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   // Optional clientId
//   // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
//   scopes: <String>[
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ],
// );

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // Property
  // GoogleSignInAccount? _currentUser;
  String contactText = '';
  late TextEditingController idController;
  late TextEditingController pwController;
  late String id;
  late String pw;
  late int quit; //user탈퇴여부
  late int admin; // admin check
  late String name;
  late int uq; //user탈퇴여부
  late String result;
  late String gid;
  late String gname;
  late List gdata;
  late List data;

  @override
  void initState() {
    // _handleSignOut(); //Google-Log-Out
    super.initState();
//Google API initState
    // _googleSignIn.onCurrentUserChanged
    //     .listen((GoogleSignInAccount? account) async {
    //   setState(() {
    //     _currentUser = account;
    //   });
    //   final GoogleSignInAccount? user = _currentUser;
    //   if (user != null) {

    //     //google info save
    //     gid = user.email.toString();
    //     gname = user.displayName.toString();

        //SharedPreferences Set data
    //     final SharedPreferences sharedPreferences =
    //         await SharedPreferences.getInstance();
    //     sharedPreferences.setString('id', user.email.toString());
    //     sharedPreferences.setString('name', user.displayName.toString());
    //     sharedPreferences.setString('email', user.email.toString());
    //     Get.to(const SplashPage());
        
    //   }
    //   if (_currentUser != null) {
    //     _handleGetContact(_currentUser!);
    //   }
    // });
    // _googleSignIn.signInSilently();

    //Propert initState
    idController = TextEditingController();
    pwController = TextEditingController();
    id = '';
    pw = '';
    quit = 0;
    admin = 0;
    name = '';
    uq = 0;
    gid = '';
    gname = '';
    data = [];
    gdata = [];
  }

  // Future<void> _handleGetContact(GoogleSignInAccount user) async {
  //   setState(() {
  //     contactText = 'Loading contact info...';
  //   });
  //   final http.Response response = await http.get(
  //     Uri.parse('https://people.googleapis.com/v1/people/me/connections'
  //         '?requestMask.includeField=person.names'),
  //     headers: await user.authHeaders,
  //   );
  //   if (response.statusCode != 200) {
  //     setState(() {
  //       contactText = 'People API gave a ${response.statusCode} '
  //           'response. Check logs for details.';
  //     });
  //     print('People API ${response.statusCode} response: ${response.body}');
  //     return;
  //   }
  //   final Map<String, dynamic> data =
  //       json.decode(response.body) as Map<String, dynamic>;
  //   final String? namedContact = _pickFirstNamedContact(data);
  //   setState(() {
  //     if (namedContact != null) {
  //       contactText = 'I see you know $namedContact!';
  //     } else {
  //       contactText = 'No contacts to display.';
  //     }
  //   });
  // }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>?;
      if (name != null) {
        return name['displayName'] as String?;
      }
    }
    return null;
  }

  // Future<void> _handleSignIn(BuildContext context) async {
  //   try {
  //     await _googleSignIn.signIn();
  //     _getJSONGData();
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  // Future<void> _handleSignOut() => _googleSignIn.disconnect();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                      child: TextField(
                        controller: idController,
                        decoration: const InputDecoration(
                          labelText: 'ID | ',
                          hintText: 'ID를 입력하세요(Enter your ID)',
                          filled: true,
                          fillColor: Color.fromARGB(225, 255, 255, 255),
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          hintStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 14),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(
                                width: 2.5,
                                color: Colors.black87),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.black87),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black87,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                      child: TextField(
                        controller: pwController,
                        decoration: const InputDecoration(
                          labelText: 'PW | ',
                          hintText: 'PW를 입력하세요(Enter your PW)',
                          filled: true,
                          fillColor: Color.fromARGB(220, 255, 255, 255),
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          hintStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 14),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(
                                width: 2.5,
                                color: Colors.black87),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.black87),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        cursorColor: Colors.black87,
                        onChanged: (value) {
                          //
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black87,
                        minimumSize: const Size(100, 46),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        if (idController.text.trim().isEmpty) {
                          emptyID(context);
                        } else if (pwController.text.trim().isEmpty) {
                          emptyPW(context);
                        } else {
                          setState(() {
                            id = idController.text.trim();
                            pw = pwController.text.trim();
                          });
                          _getJSONData().then(
                              (value) => logInCheck(context)); // data 오류
                        }
                      },
                      child: const Text(
                        '로그인',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '아직 회원이 아니신가요?',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 40,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/sign_up');
                            },
                            child: const Text(
                              '회원가입 하기',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/Find_id');
                            },
                            child: const Text(
                              '아이디 찾기',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/Find_pw');
                            },
                            child: const Text(
                              '비밀번호 찾기',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // GestureDetector(
                //   onTap: () {
                //     // _handleSignIn(context); //Google-Log-In
                //     // handleSignOut();//Google-Log-Out
                //   },
                //   child: Image.asset(
                //     "images/google-signin-button.png",
                //     width: 450,
                //     height: 65,
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Functions
  emptyID(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('ID를 입력하세요.'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }

  emptyPW(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('PW를 입력하세요.'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }

  logInCheck(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          if (data.isEmpty) {
            return AlertDialog(
              title: const Text(
                '로그인 실패!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text('ID와 PW를 확인해주세요.'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'))
              ],
            );
          } else if (quit == 1) {
            return AlertDialog(
              title: const Text(
                '로그인 실패!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text('탈퇴된 계정입니다.'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'))
              ],
            );
          } else if (admin == 1) {
            return AlertDialog(
              title: const Text(
                '관리자 확인',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text('관리자 계정으로 로그인합니다.'),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                  onPressed: () {
                    Message.uId = data[0]['uId'];
                    Navigator.popUntil(context, (route) => false); // 뒤로가기 없애기
                    Navigator.pushNamed(context, '/Customer_list');
                  },
                  child: const Text('OK'),
                )
              ],
            );
          } else {
            return AlertDialog(
              title: const Text(
                '로그인',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text('로그인 하시겠습니까?'),
              actions: [
                ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: const Text('아니요')),
                ElevatedButton(
                    onPressed: () async {
                      Message.uId = data[0]['uId'];
                      Message.uPw = data[0]['uPw'];
                      Message.uName = data[0]['uName'];
                      Message.uEmail = data[0]['uEmail'];

                      Navigator.pop(context); // 다시 로그인페이지로 돌아가지 않도록
                      final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
                      sharedPreferences.setString('id', idController.text.trim());
                      sharedPreferences.setString('name', data[0]['uName']);
                      sharedPreferences.setString('email', data[0]['uEmail']);
                      Get.to(const SplashPage());
                    },
                    child: const Text('예'))
              ],
            );
          }
        });
  }

  Future _getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/painting/user_select.jsp?id=$id&pw=$pw');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    setState(() {
      data = [];
      data.addAll(result);
    });
    if (data.isNotEmpty) {
      // 탈퇴한 계정 입력시
      var userQuit = data[0]['uQuit']; //탈퇴여부 값 받아오기
      setState(() {
        quit = userQuit;
      });
    }
  }

  // Future<bool> _getJSONGData() async {
  //   //google id select
  //   var url = Uri.parse(
  //       'http://localhost:8080/Flutter/fitness/google_user_select.jsp?id=$gid&name=$gname');
  //   var response = await http.get(url);
  //   var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
  //   List result = dataConvertedJSON['results'];
  //   setState(() {
  //     gdata = [];
  //     gdata.addAll(result);
  //   });
  //   if (gdata.isEmpty) {
  //     //google id 없는 계정입력시 -> insert
  //     googleInsertAction();
  //     return true;
  //   } else {
  //     var userquite = gdata[0]['uQuit']; //탈퇴여부 값 받아오기
  //     uq = userquite;
  //     return true;
  //   }
  // }

  // googleInsertAction() async {
  //   //google id insert
  //   var url = Uri.parse(
  //       'http://localhost:8080/Flutter/fitness/google_user_insert.jsp?id=$gid&name=$gname&email=$gid');
  //   var response = await http.get(url);
  //   setState(() {
  //     var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
  //     result = dataConvertedJSON['result'];
  //   });
  // }
}//end


