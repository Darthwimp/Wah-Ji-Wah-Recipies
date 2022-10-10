import 'package:flutter/material.dart';

import 'package:recipe_app/util/recipeCard.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashPage(MyApp(), 3),
    ),
  );
}

class splashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  splashPage(this.goToPage, this.duration);

  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: Color(0xFFDD5353),
          child: const Center(
            child: Icon(
              Icons.restaurant_outlined,
              size: 100,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDD5353),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(Icons.restaurant_outlined),
            SizedBox(width: 20),
            Text(
              "Wah Ji Wah Recipes!",
            ),
          ],
        ),
      ),
      body: recipe(),
    );
  }
}
