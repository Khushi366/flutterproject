import 'package:expensemanager/SplashScreenExample.dart';
import 'package:flutter/material.dart';

import 'AllExample.dart';
import 'BalanceExample.dart';
import 'ExpenseExample.dart';
import 'IncomeExample.dart';
import 'AddTransaction.dart';

class HomePageExample extends StatefulWidget {

   int? initialTabIndex;
   HomePageExample({this.initialTabIndex});

  @override
  State<HomePageExample> createState() => _HomePageExampleState();
}

class _HomePageExampleState extends State<HomePageExample>with TickerProviderStateMixin {
  TabController? _tabController;
   var index = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.addListener(_handelTabChange);

    if (widget.initialTabIndex != null) {
      _tabController!.index = widget.initialTabIndex!;
    }

  }

  @override
  void dispose(){
    _tabController!.dispose();
    super.dispose();
  }
  void _handelTabChange(){
    setState(() {
      index = _tabController!.index;
    });

  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return[
              SliverAppBar(
                pinned: true,
                floating: true,
                automaticallyImplyLeading: false,
                title: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                            child: Image.asset("assets/img/splash.png",scale: 15,),
                           backgroundColor: Colors.deepOrange,
                          radius: 12,
                        ),
                        SizedBox(width: 12.0,),
                        GestureDetector(
                            onTap: (){

                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BalanceExample()));
                            },
                            child: Icon(Icons.menu)),
                        SizedBox(width: 12.0,),

                        (index==0)?GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddTransaction(mytype:"Income")));
                            },
                           child: Icon(Icons.payment),
                        ):(index==1)?GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddTransaction(mytype:"Expense")));
                          },
                          child: Icon(Icons.payment),
                        ):GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddTransaction(mytype:"Income")));
                          },
                          child: Icon(Icons.payment),
                        ),
                      ],
                    )
                  ],
                ),
                bottom: TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  indicatorWeight: 2, 
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(child: Text("All",style: TextStyle(fontWeight: FontWeight.bold),)),
                    Tab(child: Text("Expense",style: TextStyle(fontWeight: FontWeight.bold),),),
                    Tab(child: Text("Income",style: TextStyle(fontWeight: FontWeight.bold),),),
                  ],
                ),
              ),
            ];
          },

          body: TabBarView(
            controller: _tabController,
            children: [
             AllExample(),
              ExpenseExample(),
              IncomeExample(),
            ],
          ),
        ),
      ),
    );
  }
}
