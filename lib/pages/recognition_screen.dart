import 'package:flutter/material.dart';
import 'package:image_to_text_app/utils/utils.dart';

class RecognitionScreen extends StatefulWidget {
  const RecognitionScreen({super.key});

  @override
  State<RecognitionScreen> createState() => _RecognitionScreenState();
}

class _RecognitionScreenState extends State<RecognitionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Text Recognition',
          style: myTextStyle(30, const Color(0xff1738EB), FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: myPrimaryColor,
      ),
      backgroundColor: myPrimaryColor,
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
