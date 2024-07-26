import 'dart:developer';

import 'package:firstapp/ActionBarExample.dart';
import 'package:firstapp/BottomNavigationExample.dart';
import 'package:firstapp/CardDialerScreen.dart';
import 'package:firstapp/CheckBoxExample.dart';
import 'package:firstapp/ContainerWidgetExample.dart';
import 'package:firstapp/DropdownButtonExample.dart';
import 'package:firstapp/EmployeeStateMagement.dart';
import 'package:firstapp/FirstScreenExample.dart';
import 'package:firstapp/RadioButtonExample.dart';
import 'package:firstapp/RegisterScreen.dart';
import 'package:firstapp/RichTextExample.dart';
import 'package:flutter/material.dart';

import 'ButtonScreen.dart';

class TabsAndPopupMenuExample extends StatefulWidget {
  const TabsAndPopupMenuExample({super.key});

  @override
  State<TabsAndPopupMenuExample> createState() => _TabsAndPopupMenuExampleState();
}

class _TabsAndPopupMenuExampleState extends State<TabsAndPopupMenuExample>with TickerProviderStateMixin {

  TabController? _tabController;

  // var i=0;
  //
  // if(i==0)
  // {
  //   print("zero");
  // }
  // else if(i==1)
  // {
  //   print("one")
  // }
  // else
  // {
  //   print("other");
  // }
  //
  // (i==0)?print("zero"):(i==1)?print("one"):print("other")


  // var marks=90;
  //
  //
  // var result="";
  // if(marks>=35)
  // {
  //   result="pass"
  // }
  // else
  // {
  //   result="fail";
  // }
  //
  // var result = (marks>=35)?"pass":"fail";

  // var i=0;
  //
  // if(i==0)
  // {
  //   print("one")
  // }
  // else
  // {
  //   print("other")
  // }
  //
  // (i==0)?print("One"):print("other")

  var index=0;

    @override
    void initState() {
      super.initState();
      _tabController = TabController(length: 3, vsync: this);
      _tabController!.addListener(_handelTabChage);
    }

    @override
    void dispose(){
      _tabController!.dispose();
      super.dispose();
    }

  void _handelTabChage()
  {
   setState(() {
     index = _tabController!.index;
   });
  }

  void _handelPopupMenuSelection(int value){
    switch(value){
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ActionBarExample())
         );
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavigationExample())
        );
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ButtonScreen())
        );
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CardDialerScreen())
        );
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckBoxExample())
        );
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ContainerWidgetExample())
        );
        break;
      case 7:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DropdownButtonExample())
        );
        break;
      case 8:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> EmployeeStateManagement())
        );
        break;
      case 9:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> FirstScreenExample())
        );
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 3,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text("Tabs"),
    //       bottom: TabBar(
    //         indicator: BoxDecoration(
    //             borderRadius: BorderRadius.circular(50), // Creates border
    //             color: Colors.greenAccent),
    //         tabs: [
    //           Tab(child: Text("Chats"),icon: Icon(Icons.add_circle),),
    //           Tab(child: Text("Status"),),
    //           Tab(child: Text("Calls"),),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         RegisterScreen(),
    //         RichTextExample(),
    //         RadioButtonExample()
    //       ],
    //     ),
    //
    //   ),
    // );

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: Text("Tabs"),
                  pinned: true,
                  actions: [
                    (index==0)?IconButton(onPressed: (){}, icon: Icon(Icons.add_circle))
                        :(index==1)?IconButton(onPressed: (){}, icon: Icon(Icons.access_time_filled))
                        :IconButton(onPressed: (){




                    }, icon: Icon(Icons.add_a_photo)),
                    (index==0)
                        ? PopupMenuButton(itemBuilder: (BuildContext context){
                      return[
                        PopupMenuItem(
                        child: Text("New group"),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text("New broadcast"),
                          value: 2,
                        ),
                        PopupMenuItem(
                          child: Text("Linked device"),
                          value: 3,
                        ),
                        PopupMenuItem(
                          child: Text("Starred messages"),
                          value: 4,
                        ),
                        PopupMenuItem(
                          child: Text("Payments"),
                          value: 5,
                        ),
                        PopupMenuItem(
                          child: Text("Settings"),
                          value: 6,
                        ),
                      ];
                    },
                      onSelected: (int value){
                        _handelPopupMenuSelection(value);
                      },
                    ):(index==1)
                   ? PopupMenuButton(
                      itemBuilder:(BuildContext context){
                        return[
                          PopupMenuItem(
                          child: Text("Status privacy"),
                          value: 7,
                        ),
                      ];
                     },
                      onSelected: (int value){
                        _handelPopupMenuSelection(value);
                      }
                    ):
                    PopupMenuButton(
                        itemBuilder:(BuildContext context){
                          return[
                            PopupMenuItem(
                              child: Text("Clear call log"),
                              value: 8,
                            ),
                            PopupMenuItem(
                              child: Text("Settings"),
                              value: 9,
                            ),
                          ];
                        },
                        onSelected: (int value){
                          _handelPopupMenuSelection(value);
                        }
                    )
                  ],
                  floating: true,
                  backgroundColor: (index==0)?Colors.red:(index==1)?Colors.blue:Colors.purple,
                  bottom: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50), // Creates border
                        color: Colors.greenAccent),
                    tabs: [
                      Tab(child: Text("Chats"), icon: Icon(Icons.add_circle),),
                      Tab(child: Text("Status"),),
                      Tab(child: Text("Calls"),),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: [
                RegisterScreen(),
                RichTextExample(),
                RadioButtonExample()
              ],
            ),
          ),
        )
    );
  }
}
