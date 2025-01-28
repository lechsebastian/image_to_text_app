import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_to_text_app/utils/api_key.dart';
import 'package:image_to_text_app/utils/utils.dart';
import 'package:http/http.dart' as http;

class RecognitionScreen extends StatefulWidget {
  const RecognitionScreen({super.key});

  @override
  State<RecognitionScreen> createState() => _RecognitionScreenState();
}

class _RecognitionScreenState extends State<RecognitionScreen> {
  File? pickedImage;

  optionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              child: Text(
                'Gallery',
                style: myTextStyle(20, Colors.black, FontWeight.w800),
              ),
              onPressed: () => pickImage(ImageSource.gallery),
            ),
            SimpleDialogOption(
              child: Text(
                'Camera',
                style: myTextStyle(20, Colors.black, FontWeight.w800),
              ),
              onPressed: () => pickImage(ImageSource.camera),
            ),
            SimpleDialogOption(
              child: Text(
                'Cancel',
                style: myTextStyle(20, Colors.black, FontWeight.w800),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    setState(() {
      pickedImage = File(image.path);
    });

    Navigator.pop(context);

    // Prepare the image
    Uint8List bytes = await Io.File(pickedImage!.path).readAsBytes();
    String img64 = base64Encode(bytes);

    // Send the image to the server
    String url = 'https://api.ocr.space/parse/image';
    var data = {'base64Image': 'data:image/png;base64,$img64'};
    var header = {'apikey': apiKey};
    http.Response response =
        await http.post(Uri.parse(url), body: data, headers: header);

    // Get the response
    Map result = jsonDecode(response.body);
    print(result['ParsedResults'][0]['ParsedText']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.deepPurple.shade400,
            onPressed: () {},
            child: Icon(
              Icons.copy,
              size: 28,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Colors.deepPurple.shade400,
            onPressed: () {},
            child: Icon(
              Icons.reply,
              size: 34,
              color: Colors.white,
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          'Text Recognition',
          style: myTextStyle(
              35, Colors.deepPurple.withOpacity(0.8), FontWeight.w800),
        ),
        centerTitle: true,
        backgroundColor: myPrimaryColor,
      ),
      backgroundColor: myPrimaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () => optionsDialog(context),
                child: Image(
                  width: 256,
                  height: 256,
                  image: pickedImage == null
                      ? AssetImage('images/add_file.png')
                      : FileImage(pickedImage!),
                  color:
                      pickedImage == null ? Colors.deepPurple.shade400 : null,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                'Lorem ipsum',
                style: myTextStyle(
                    25, Colors.deepPurple.withOpacity(0.8), FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
