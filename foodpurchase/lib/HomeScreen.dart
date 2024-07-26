import 'package:flutter/material.dart';

import 'Auth/ProfileScreen.dart';
import 'Product/AddProduct.dart';
import 'Product/ViewProduct.dart';
import 'Products2/ViewProducts2.dart';
import 'Recipe/MyFavList.dart';
import 'Recipe/SearchRecipes.dart';
import 'Recipe/ViewRecipe2.dart';
import 'Recipe/ViewRecipes.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("products/Recipe"),
      ),
      drawer: Drawer(
        child: Drawer(
          child: ListView(
            children: [
             ListTile(
               title: Text("Profile"),
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
               },
             ),
        
              ListTile(
                title: Text("View Products"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProduct()));
                },
              ),
              ListTile(
                title: Text("View Products3 "),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProduct3()));
                },
              ),
              ListTile(
                title: Text("Add Products"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduct()));
                },
              ),
        
              ListTile(
                title: Text("View Recipes"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewrecipes()));
                },
              ),
              ListTile(
                title: Text("View Recipes2"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewrecipe2()));
                },
              ),
              ListTile(
                title: Text("Search Recipe"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Searchrecipes()));
                },
              ),
              ListTile(
                title: Text("Fav List"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFavList()));
                },
              )
            ],
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index){
            return Container();
      }),
    );
  }
}
