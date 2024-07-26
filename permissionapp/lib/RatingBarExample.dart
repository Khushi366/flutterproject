import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarExample extends StatefulWidget {
  const RatingBarExample({super.key});

  @override
  State<RatingBarExample> createState() => _RatingBarExampleState();
}

class _RatingBarExampleState extends State<RatingBarExample> {
  
  var userrating=0.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating Bar"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          RatingBar.builder(
          initialRating: 1,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
           setState(() {
             userrating = rating;
           });
          },
        ),
            ElevatedButton(onPressed: (){

              log(userrating.toString());

            }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
