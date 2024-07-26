import 'package:flutter/material.dart';

class ImageExample extends StatefulWidget {
  const ImageExample({super.key});

  @override
  State<ImageExample> createState() => _ImageExampleState();
}

class _ImageExampleState extends State<ImageExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Example"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Icon(Icons.add_a_photo_outlined,size: 100.0,color: Colors.red.shade400,),
            Image.asset("assets/img/plane.jpeg",width: 200.0),
            Image.network("https://www.shutterstock.com/image-vector/airplane-one-line-drawing-on-600nw-2276370983.jpg"),
           // FadeInImage.assetNetwork(placeholder: "assets/img/plane.jpeg", image: "https://t4.ftcdn.net/jpg/02/60/68/27/360_F_260682748_wH7CoasvekTgzrhCbaEdGoFeTe4gC5qz.jpg")
          ],
        ),
      ),
    );
  }
}
