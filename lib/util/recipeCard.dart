import 'package:flutter/material.dart'; //importing dependencies
import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_app/util/videoImp.dart';

class recipe extends StatefulWidget {
  //creating a stateful widget for our buttons/item_cards
  @override
  State<recipe> createState() => _recipeState();
}

class _recipeState extends State<recipe> {
  @override
  Widget recipeCard(BuildContext context, String imageName) {
    //creating a widget function for redundancy with string parameteres
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Butter_Chicken()), //re-routing to the a different page
        );
      },
      child: Container(
        //initializing the container
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "$imageName",
            style: GoogleFonts.dancingScript(
              fontSize: 40,
              color: Colors.yellow[500],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: BoxDecoration(
          //adding decorations to the container
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            //adding a background image to the container
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
            image: AssetImage('assets/images/$imageName.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDDBC0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //calling the widget function we built earlier
            recipeCard(context, 'Butter Chicken'),
            recipeCard(context, 'Chicken Biryani'),
            recipeCard(context, 'Chicken Momos'),
            recipeCard(context, 'Chocolate Ice Cream'),
            recipeCard(context, 'Chole Bhature'),
            recipeCard(context, 'Panner Tikka Masala'),
            recipeCard(context, 'Rajma Chawal'),
          ],
        ),
      ),
    );
  }
}
