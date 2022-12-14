import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Genre extends StatefulWidget {
  const Genre({Key? key}) : super(key: key);

  @override
  State<Genre> createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  File? selectedImage; // Picture의 file name
  String result = ""; // Flask의 return value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Genre Recognition'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: selectedImage == null
                  ? Column(
                      children: const [
                        Icon(
                          Icons.image_outlined,
                          size: 150,
                          color: Colors.black38,
                        ),
                        Text(
                          '우측하단의 버튼을 눌러 이미지를 업로드하세요',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 15),
                        ),
                      ],
                    )
                  : Image.file(selectedImage!),
            ),
            ElevatedButton(
              onPressed: onUploadImage,
              child: const Text('확인하기'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: getImage,
        child: const Icon(
          Icons.add_a_photo,
        ),
      ),
    );
  }

  // -- Functions
  onUploadImage() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("http://localhost:5000/uploader"));

    // multipart request
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'image',
        selectedImage!.readAsBytes().asStream(),
        selectedImage!.lengthSync(),
        filename: selectedImage!.path.split('/').last,
      ),
    );

    request.headers.addAll(headers);
    var resp = await request.send();
    http.Response response = await http.Response.fromStream(resp);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      setState(() {
        result = dataConvertedJSON['result'];
      });
      _showDialog(context, result);
    });
  }

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path);
    });
  }

  _showDialog(BuildContext context, String result) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Genre Recognition"),
            content: Text("선택하신 그림은 $result 입니다."),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
}
