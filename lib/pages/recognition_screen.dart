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
              Image(
                width: 256,
                height: 256,
                image: AssetImage('images/add_file.png'),
                color: Colors.deepPurple.shade400,
              ),
              SizedBox(
                height: 130,
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
