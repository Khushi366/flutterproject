import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

class FetchGalleryPhotoes extends StatefulWidget {
  const FetchGalleryPhotoes({super.key});

  @override
  State<FetchGalleryPhotoes> createState() => _FetchGalleryPhotoesState();
}

class _FetchGalleryPhotoesState extends State<FetchGalleryPhotoes> {

  List<AssetEntity> _mediaFiles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestStoragePermission();

  }
  
// storage permission.
  Future<void> requestStoragePermission() async {
    var status = await Permission.storage.status;
    await Permission.storage.request();
    if (status.isDenied) {
      await Permission.storage.request();
    }
    if (await Permission.storage.isGranted) {

      fetchAllMedia().then((mediaFiles) {
        setState(() {
          _mediaFiles = mediaFiles;
        });
      });

    } else {
      openAppSettings();
    }
   }

  Future<List<AssetEntity>> fetchAllMedia() async {
    // Request permission
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image, // Fetch all types of media
    );

    // Fetch all media
    List<AssetEntity> allMedia = [];
    for (var album in albums) {
      int assetCount = await album.assetCountAsync;
      List<AssetEntity> mediaFiles = await album.getAssetListRange(
        start: 0,
        end: assetCount,
      );
      allMedia.addAll(mediaFiles);
    }

    return allMedia;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Gallery Photoes"
          ,style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600),),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: _mediaFiles.length,
        itemBuilder: (context, index) {
          return FutureBuilder<Uint8List?>(
            future: _mediaFiles[index].thumbnailData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                return Image.memory(snapshot.data!, fit: BoxFit.cover);
              } else {
                return Center(child: Icon(Icons.photo,color: Colors.black12,));
              }
            },
          );
        },
      ),
    );
  }
}
