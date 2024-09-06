import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.menu,color: Colors.white,), // Hamburger menu icon
          onPressed: () {
            // Handle menu button press here
            // For example, open a drawer or show a menu
          },
        ),
        actions: [
          SizedBox(width: 50,),
          Expanded(
            child: Container(
              width: 300, // Set the width of the TextField
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0), // Adjust horizontal padding
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  fillColor: Colors.white, // Set the background color
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0), // Adjust vertical padding for hint text
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.notifications,color: Colors.white,), // First icon
            onPressed: () {
              // Handle notifications button press here
            },
          ),
          IconButton(
            icon: Icon(Icons.qr_code_scanner_rounded,color: Colors.white,), // Second icon
            onPressed: () {
              // Handle account button press here
            },
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.red,
                            width: 6
                          ),

                        ),
                       child:Center(child: Text("285",style: TextStyle(fontWeight: FontWeight.bold),))
                    ),
                    Text("Total"),
                    Text("Vehicle"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.orange,
                              width: 6
                          ),

                        ),
                        child:Center(child: Text("0",style: TextStyle(fontWeight: FontWeight.bold),))
                    ),
                    Text("Over"),
                    Text("Speeding"),

                  ],
                ),
                Column(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.tealAccent,
                              width: 6
                          ),

                        ),
                        child:Center(child: Text("1",style: TextStyle(fontWeight: FontWeight.bold),))
                    ),
                    Text(""),
                    Text("moving"),

                  ],
                ),
                Column(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.yellow,
                              width: 6
                          ),

                        ),
                        child:Center(child: Text("2",style: TextStyle(fontWeight: FontWeight.bold),))
                    ),
                    Text(""),
                    Text("ldie"),

                  ],
                ),
                Column(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.red,
                              width: 6
                          ),

                        ),
                        child:Center(child: Text("7",style: TextStyle(fontWeight: FontWeight.bold),))
                    ),
                    Text(""),
                    Text("Stopped"),
                  ],
                ),
              ],
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 325,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2), // Shadow color with slight opacity
                            spreadRadius: 1, // How much the shadow spreads
                            blurRadius: 4, // How soft the shadow looks
                            offset: Offset(3, 3), // X and Y offsets of the shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.network("https://cdn.pixabay.com/photo/2014/03/24/17/06/car-295043_1280.png",width: 55,),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Text("MARKON TESTING DEVICE 1 2024-06-26T14:33:2 7.89"),
                                   ),

                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Icon(Icons.power,color: Colors.green,size: 18,),
                                    Text("Power"),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Icon(Icons.power,color: Colors.green,size: 18,),
                                    Text("Power"),
                                  ],
                                ),
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on,color: Colors.deepPurple,size: 18,),
                              Expanded(
                                  child: Text("Yusyf Sarai Market, Vasant Vihar Teshsil, New Delhi, Defence Colony Tehsil, South East Delhi District, Delhi.110029, India",)),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: Colors.black12
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text("46667.0KM",style: TextStyle(color: Colors.amberAccent,fontWeight: FontWeight.bold)),
                                          Text("OD0",style: TextStyle(fontSize:10,color: Colors.white)),

                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 1, // Divider width
                                      height: 40, // Divider height
                                      color: Colors.white, // Divider color
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text("3668.36/0",style: TextStyle(color: Colors.amberAccent,fontWeight: FontWeight.bold),),
                                          Text("Total DIST",style: TextStyle(fontSize:10,color: Colors.white)),

                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 1, // Divider width
                                      height: 40, // Divider height
                                      color: Colors.white, // Divider color
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text("46.KM/HR",style: TextStyle(color: Colors.amberAccent,fontWeight: FontWeight.bold)),
                                          Text("CURR.SPD",style: TextStyle(fontSize:10,color: Colors.white)),

                                        ],
                                      ),
                                    ),
                                  ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Divider(color: Colors.black12,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.location_on,color: Colors.green,size: 27,),
                              Container(
                                width: 1, // Divider width
                                height: 30, // Divider height
                                color: Colors.black, // Divider color
                              ),
                              Icon(Icons.book,color: Colors.red,size: 27,),
                              Container(
                                width: 1, // Divider width
                                height: 30, // Divider height
                                color: Colors.black, // Divider color
                              ),
                              Icon(Icons.car_crash,color: Colors.blue,size: 27,),

                            ],
                          )
                        ],
                      ),


                    );


              }),
            )
          ],
        ),
      ),


    );
  }
}
