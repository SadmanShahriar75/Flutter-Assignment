import 'package:flutter/material.dart';

class Module_10 extends StatelessWidget {
  const Module_10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Getting App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello World!",
              style: TextStyle(color: Colors.red, fontSize: 40),
            ),
            SizedBox(height: 20),
            Text(
              "Welcome to Flutter",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Image.network(
              "https://storage.googleapis.com/cms-storage-bucket/icon_flutter.0dbfcc7a59cd1cf16282.png",

              height: 150,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text("Press me"),
            ),
          ],
        ),
      ),
    );
  }
}
