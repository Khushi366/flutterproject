import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class ImageDownload extends StatefulWidget {

  var imageUrl = "";

   ImageDownload({super.key, required this.imageUrl});

  @override
  State<ImageDownload> createState() => _ImageDownloadState();
}

class _ImageDownloadState extends State<ImageDownload> {


  var isLoading = false;

  _saveImageToGallery()async{

    setState(() {
      isLoading = true;

    });
   var response = await http.get(Uri.parse(widget.imageUrl));
   if(response.statusCode != 200)
   {
     log('Failed to download image: HTTP status code ${response.statusCode}');
     setState(() {
       isLoading = false;

     });
     return;
   }
    var appDir = await getTemporaryDirectory();
    var filePath = appDir.path + '/image.png';
    await File(filePath).writeAsBytes(response.bodyBytes);
    var result = await ImageGallerySaver.saveFile(filePath);
    log('Image saved to gallery: '+ result.toString());

    setState(() {
      isLoading = false;

    });

  }
  @override

  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            SizedBox(height: 50.0,),
            Center(child: Image.network(widget.imageUrl,width: 500,height:300 ,)),
            SizedBox(height: 20.0,),

            ElevatedButton(
              onPressed: isLoading?null:_saveImageToGallery,
              child: isLoading?CircularProgressIndicator():Text("Download"),
            )

          ],
        ),

      ),
    );
  }
}
