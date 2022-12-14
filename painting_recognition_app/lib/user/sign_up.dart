import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Property
  late TextEditingController idController;
  late TextEditingController pwController;
  late TextEditingController nameController;
  late TextEditingController emailController;

  late String id;
  late String pw;
  late String name;
  late String email;
  late String result;
  late bool DuplicatedFinish;
  late List data;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    data = [];
    getJSONData();

    DuplicatedFinish = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            foregroundColor: Colors.black87,
            title: const Text(
              "회원가입",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            toolbarHeight: 100,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                    child: Row(
                      children: [
                        const Text(
                          '아이디 : ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 23,
                        ),
                        Flexible(
                          child: TextField(
                            controller: idController,
                            decoration: const InputDecoration(
                              labelText: 'ID 를 입력하세요',
                              labelStyle: TextStyle(
                                color: Colors.black38,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.black38,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              id = idController.text;
                              bool isDuplicated = false;
                              bool isIdEmpty = false;
                              for (int i = 0; i < data.length; i++) {
                                if (data[i]['uId'] == id) {
                                  errorSnackBar_id(context);
                                  isDuplicated = true;
                                  isIdEmpty = false;
                                  idController.text = '';
                                }
                              }
                              if (id.isEmpty) {
                                isDuplicated = true;
                                isIdEmpty = true;
                                errorSnackBar_idEmpty(context);
                              }

                              if ((id.length < 4 || id.length > 15) &&
                                  !isIdEmpty) {
                                errorSnackBar_idCheck(context);
                                isDuplicated = true;
                              }

                              if (!isDuplicated) {
                                allowSnackBar_id(context);
                                DuplicatedFinish = true;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black87,
                              minimumSize: const Size(80, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('중복체크'))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                    child: Row(
                      children: [
                        const Text(
                          '패스워드 : ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: pwController,
                            decoration: const InputDecoration(
                              labelText: '특수,대소문자,숫자 포함 8~15자이내로 입력',
                              labelStyle: TextStyle(
                                color: Colors.black38,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black87),
                              ),
                            ),
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            cursorColor:
                                Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                    child: Row(
                      children: [
                        const Text(
                          '이름 : ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 34,
                        ),
                        Flexible(
                          child: TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              labelText: '성함을 입력하세요',
                              labelStyle: TextStyle(
                                color: Colors.black38,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black87),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            cursorColor:
                                Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                    child: Row(
                      children: [
                        const Text(
                          'Email : ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              labelText: 'email 형식으로 입력하세요',
                              labelStyle: TextStyle(
                                color: Colors.black38,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black87),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            cursorColor:
                                Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        id = idController.text;
                        pw = pwController.text;
                        name = nameController.text;
                        email = emailController.text;
                        if (DuplicatedFinish == false) {
                          errorSnackBar_Duplicated(context);
                        } else {
                          _Validation();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        minimumSize: const Size(80, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('회원가입하기'))
                ],
              ),
            ),
          )),
    );
  }

  // --- Functions

  Future getJSONData() async {
    data.clear();
    var url = Uri.parse(
        "http://localhost:8080/Flutter/fitness/id_Duplicate_Check.jsp?$id");
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      //키값
      List value = dataConvertedJSON['results'];
      //데이터에 넣기
      data.addAll(value);
    });
  }

  _Validation() {
    final id = idController.text;
    final pw = pwController.text;
    final name = nameController.text;
    final email = emailController.text;

    if (RegExp(r'^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$')
        .hasMatch(pw)) {
      if (name.length > 2 && name.length < 15) {
        if (RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(email)) {
          _showDialog(context);
        } else {
          errorSnackBar_Email(context);
        }
      } else {
        errorSnackBar_name(context);
      }
    } else {
      errorSnackBar_pw(context);
    }
  }

  _showDialog(BuildContext ctx) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Sign Up'),
            content: const Text('회원으로 가입하시겠어요?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  signinAction();
                  _showFinishDialog(context);
                },
                child: const Text('예'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('아니오'),
              ),
            ],
          );
        });
  }

  _showFinishDialog(BuildContext ctx) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('환영합니다'),
            content: const Text('회원가입이 완료되었습니다'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  Navigator.pushNamed(context, '/sign_in');
                },
                child: const Text('로그인하러가기'),
              ),
            ],
          );
        });
  }

  signinAction() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/painting/user_insert.jsp?id=$id&pw=$pw&name=$name&email=$email');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];

      if (result == 'OK') {
        //_showDialog(context);
      } else {
        errorSnackBar(context);
      }
    });
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("사용자 정보 입력에 문제가 발생 하였습니다."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  allowSnackBar_id(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("\t\t\t\t사용가능한 아이디입니다."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  errorSnackBar_Duplicated(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("\t\t\t\t아이디 중복체크를 해주세요!"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  errorSnackBar_id(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("\t\t\t\t중복된 아이디입니다.\n\t\t\t다른 아이디를 사용해주세요."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  errorSnackBar_idCheck(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("아이디를 4자 이상 15자 이내로 입력해주세요!"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  errorSnackBar_idEmpty(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("아이디를 입력해주세요!"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  errorSnackBar_pw(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:
            Text("\t\t\t\t패스워드를 특수/대소문자/숫자 포함\n\t\t\t8자 ~ 15자 이내로 입력해주세요."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  errorSnackBar_name(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("\t\t\t\t\t이름은 2자 ~ 15자 이내로 입력해주세요."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  errorSnackBar_Email(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("\t\t\t\t\t잘못된 이메일 형식입니다.\n\t\t\t올바른 형식으로 입력해주세요."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}//end
