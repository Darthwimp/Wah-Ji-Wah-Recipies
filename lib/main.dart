import 'package:flutter/material.dart'; //importing dependencies

import 'package:recipe_app/util/recipeCard.dart';

void main() {
  //the main function which routes to the splash page
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashPage(firstpage(), 3),
    ),
  );
}

class splashPage extends StatelessWidget {
  //the splash page
  int duration = 0; //initializing parameters
  Widget goToPage;

  splashPage(this.goToPage,
      this.duration); //the splash page constructor with parameters as the go to page and the time duration as integer

  Future<bool> _onWillPop() async {
    //creating a function so that re-routing to the page won't be possible
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      //creating the splash page
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
              Icons.restaurant_outlined, //adding an icon to the splash page
              size: 100,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class firstpage extends StatelessWidget {
  //creating the first page of our app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //the appbar of our firstpage
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
      body:
          recipe(), //reroutes to the recipe page which basically lists all the item card in a column
    );
  }
}
