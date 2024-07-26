import 'package:firstapp/DialerScreen.dart';
import 'package:flutter/material.dart';

class DrawerExample extends StatefulWidget {
  const DrawerExample({super.key});

  @override
  State<DrawerExample> createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<DrawerExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Example"),
        actions: [
          Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: (){
              Scaffold.of(context).openEndDrawer();
            },
          ),
         ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("About"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: ()
              {
                Navigator.of(context).pop();// Drawer close
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>DialerScreen())
                );
              },
            ),
            ListTile(
              title: Text("About"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: ()
              {

              },
            ),
            ListTile(
              title: Text("About"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: ()
              {

              },
            ),
            Image.asset("assets/img/plane.jpeg")
          ],
        ),
      ),
    );
  }
}
