import 'package:dialogue_player/assets/constant.dart';
import 'package:dialogue_player/presentation/dialogue_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                love,
                style: TextStyle(fontSize: 10),
              ),
              const CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
              const Text('Are you ready ?'),
              Container(
                width: 200,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DialogueStart();
                        },
                      ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.thumb_up),
                        Text('START'),
                        Icon(Icons.thumb_up)
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
