import 'package:flutter/material.dart';

class ActionBarExample extends StatefulWidget {
  const ActionBarExample({super.key});

  @override
  State<ActionBarExample> createState() => _ActionBarExampleState();
}

class _ActionBarExampleState extends State<ActionBarExample> {

  var ch1=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Actionbar"),
        ),
        backgroundColor: Colors.green,
        leading: CircleAvatar(
          child: Text("A"),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        label: Text("ADD"),
        icon: Icon(Icons.add_circle),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add_circle),
      //   backgroundColor: Colors.purple,
      //   onPressed: (){},
      // ),
      body: ListView(
        children: [

          Switch(
              value: ch1,
              activeColor: Colors.purple,
              activeTrackColor: Colors.red,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.red,
              onChanged: (val)
          {
            setState(() {
              ch1=val;
            });
          }),

          ListTile(
            leading: CircleAvatar(
              child: Text("K"),
            ),
            title: Text("Karon Infotech"),
            subtitle: Text("Hi..."),
            trailing: Text("10:30 AM"),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text("K"),
            ),
            title: Text("Karon Infotech"),
            subtitle: Text("Hi..."),
            trailing: Text("10:30 AM"),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text("K"),
            ),
            title: Text("Karon Infotech"),
            subtitle: Text("Hi..."),
            trailing: Text("10:30 AM"),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text("K"),
            ),
            title: Text("Karon Infotech"),
            subtitle: Text("Hi..."),
            trailing: Text("10:30 AM"),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text("K"),
            ),
            title: Text("Karon Infotech"),
            subtitle: Text("Hi..."),
            trailing: Text("10:30 AM"),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text("K"),
            ),
            title: Text("Karon Infotech"),
            subtitle: Text("Hi..."),
            trailing: Text("10:30 AM"),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text("K"),
            ),
            title: Text("Karon Infotech"),
            subtitle: Text("Hi..."),
            trailing: Text("10:30 AM"),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text("K"),
            ),
            title: Text("Karon Infotech"),
            subtitle: Text("Hi..."),
            trailing: Text("10:30 AM"),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text("K"),
            ),
            title: Text("Karon Infotech"),
            subtitle: Text("Hi..."),
            trailing: Text("10:30 AM"),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text("K"),
            ),
            title: Text("Karon Infotech"),
            subtitle: Text("Hi..."),
            trailing: Text("10:30 AM"),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text("K"),
            ),
            title: Text("Karon Infotech"),
            subtitle: Text("Hi..."),
            trailing: Text("10:30 AM"),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text("K"),
            ),
            title: Text("Karon Infotech"),
            subtitle: Text("Hi..."),
            trailing: Text("10:30 AM"),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text("K"),
            ),
            title: Text("Karon Infotech"),
            subtitle: Text("Hi..."),
            trailing: Text("10:30 AM"),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              child: Text("K"),
            ),
            title: Text("Karon Infotech"),
            subtitle: Text("Hi..."),
            trailing: Text("10:30 AM"),
            onTap: (){

            },
          ),
          Divider(),
          // Container(
          //   width: 100.0,
          //   height: 100.0,
          //   color: Colors.red,
          //   margin: EdgeInsets.all(10.0),
          // ),
          // Container(
          //   width: 100.0,
          //   height: 100.0,
          //   color: Colors.red,
          //   margin: EdgeInsets.all(10.0),
          // ),
          // Container(
          //   width: 100.0,
          //   height: 100.0,
          //   color: Colors.red,
          //   margin: EdgeInsets.all(10.0),
          // ),
          // Container(
          //   width: 100.0,
          //   height: 100.0,
          //   color: Colors.red,
          //   margin: EdgeInsets.all(10.0),
          // ),
          // Container(
          //   width: 100.0,
          //   height: 100.0,
          //   color: Colors.red,
          //   margin: EdgeInsets.all(10.0),
          // ),
          // Container(
          //   width: 100.0,
          //   height: 100.0,
          //   color: Colors.red,
          //   margin: EdgeInsets.all(10.0),
          // ),
          // Container(
          //   width: 100.0,
          //   height: 100.0,
          //   color: Colors.red,
          //   margin: EdgeInsets.all(10.0),
          // ),
          // Container(
          //   width: 100.0,
          //   height: 100.0,
          //   color: Colors.red,
          //   margin: EdgeInsets.all(10.0),
          // ),
          // Container(
          //   width: 100.0,
          //   height: 100.0,
          //   color: Colors.red,
          //   child: Text("1"),
          //   margin: EdgeInsets.all(10.0),
          // ),
        ],
      ),
    );
  }
}
