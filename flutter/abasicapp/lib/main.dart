import 'package:flutter/material.dart';

void main() {
  runApp(const appbasic());
}

class appbasic extends StatelessWidget {
  const appbasic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 138, 119, 247),
          title: Text("A Basic App"),
          leading: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 255, 255, 255),
          ), //leading for icons at left
          actions: [
            Icon(Icons.search, color: Color.fromARGB(255, 255, 255, 255)),
            Icon(Icons.star, color: Color.fromARGB(255, 255, 255, 255)),
          ],
          //leading for icons at right
        ),
        backgroundColor: Color.fromARGB(255, 245, 242, 255),
        body: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 128, 95, 227),
                    Color.fromARGB(255, 79, 49, 170),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0).withValues(alpha: 0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],

                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              // child: Text(
              //   'My first app',
              //   style: TextStyle(
              //     fontSize: 30,
              //     fontFamily: "Roboto",
              //     fontWeight: FontWeight.bold,
              //     color: Color.fromARGB(255, 255, 255, 255),
              //   ),
              child: Icon(
                Icons.file_download,
                color: Color.fromARGB(255, 249, 248, 248),
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
