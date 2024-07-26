import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permissionapp/FetchContactsScreen.dart';
import 'package:permissionapp/FetchGalleryPhotoes.dart';
import 'package:permissionapp/FirstScreenAnimation.dart';
import 'package:permissionapp/PiChartPage.dart';
import 'package:permissionapp/RatingBarExample.dart';
import 'package:permissionapp/WebViewExample.dart';

import 'BarChartPage.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: const EdgeInsets.all(8.0),
        children: [
          // UserAccountsDrawerHeader(
          //   accountName: Text(""+firstName.toString()),
          //   accountEmail: Text(""+email.toString()),
          //
          //   currentAccountPicture: image.isNotEmpty
          //       ? FadeInImage.assetNetwork(
          //     placeholder: '',
          //     image: image,
          //     width: 100,
          //     placeholderErrorBuilder: (context, error, stackTrace) {
          //       return SizedBox(
          //           width: 5.0,
          //           height: 6.0,
          //           child: CircularProgressIndicator(color: Colors.white,));
          //     },
          //   ) : CircleAvatar(
          //     child: Icon(Icons.person),
          //   ),
          //   decoration: BoxDecoration(
          //     color: Color(0xFF233645),
          //   ),
          // ),

          SizedBox(height: 50.0,),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text("Contact"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FetchContactsScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_album_outlined),
            title: const Text("Gallery"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FetchGalleryPhotoes()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.pie_chart),
            title: const Text("PiChart"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PieChartPage()));
            },
          ), ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text("BarChart"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BarChartPage()));
            },
          ),ListTile(
            leading: const Icon(Icons.animation),
            title: const Text("ScreenAnimation"),

              onTap: () {
                Navigator.of(context).push(PageTransition(type: PageTransitionType.fade, child: FirstScreenAnimation(),
                ));
              },
            // Navigator.of(context).push(PageTransition(
            //                   type: PageTransitionType.rotate,
            //                   duration: Duration(seconds: 1),
            //                   alignment: Alignment.center,
            //                   child: FirstScreenAnimation(),
          ),
          // ListTile(
          //   leading: const Icon(Icons.view_agenda),
          //   title: const Text("View Product"),
          //   onTap: () {
          //     Get.to(ViewProduct());
          //   },
          // ),

          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("RatingBar"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RatingBarExample()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.web),
            title: const Text("WebView"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> WebViewExample()));
            },
          ),
        ],
      ),
    );
  }

}
