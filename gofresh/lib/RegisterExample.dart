import 'package:flutter/material.dart';

class RegisterExample extends StatefulWidget {
  const RegisterExample({super.key});

  @override
  State<RegisterExample> createState() => _RegisterExampleState();
}

class _RegisterExampleState extends State<RegisterExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.0,),

              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 33.0,
                    height: 33.0,
                    decoration: BoxDecoration(
                        color: Color(0xFFFFF2EE),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(width: 2,color: Color(0xFFF4F4F4))

                    ),
                    child: IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();

                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded,size: 15.0,color: Color(0xFFFE7551),),
                    ),
                  ),
                ),
              ),
              Image.asset("assets/img/login.png",width: 130.0,height: 130.0,),
              SizedBox(width: 720.0,height: 30.0,),
              Text("Creat New Account",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 22.0),),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Full Name",hintStyle: TextStyle(fontFamily: "Semibold",color: Color(0xFFC0C0C0)),
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  cursorColor: Color(0xFFC0C0C0) ,
                  style: TextStyle(fontFamily: "Semibold",color: Color(0xFFC0C0C0)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "96523 75214",hintStyle: TextStyle(fontFamily: "Semibold",color: Color(0xFF010101)),

                    contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFE7551)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFE7551)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  cursorColor: Color(0xFFFE7551),

                  //style: TextStyle(fontFamily: "Semibold"),
                ),
              ),



              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",hintStyle: TextStyle(fontFamily: "Semibold",color: Color(0xFFC0C0C0)),
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  cursorColor: Color(0xFFC0C0C0) ,
                  style: TextStyle(fontFamily: "Semibold",color: Color(0xFFC0C0C0)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.visibility_off_outlined,color: Color(0xFFC0C0C0),size: 22.0,),
                    ),
                    border: OutlineInputBorder(),
                    hintText: "Password",hintStyle: TextStyle(fontFamily: "Semibold",color: Color(0xFFC0C0C0)),
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  cursorColor: Color(0xFFC0C0C0) ,
                  style: TextStyle(fontFamily: "Semibold",color: Color(0xFFC0C0C0)),
                ),
              ),


              SizedBox(height: 30.0,),
              ElevatedButton(

                onPressed: (){

                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFFE7551)),
                  fixedSize: MaterialStateProperty.all(Size(185.0,45.0)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      )
                  ),
                ),
                child: Text("Create",style: TextStyle(fontFamily: "SourceSansPro",color: Color(0xFFFFFFFF),fontSize: 20.0,),),
              ),
              SizedBox(height: 20.0,),


              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0,left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already Have an account? ",style: TextStyle(fontFamily: "Semibold",fontSize: 12.0),),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Text("Login",style: TextStyle(fontFamily: "SourceSansPro",fontSize: 12.0,color: Color(0xFFFE7551),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFFFE7551),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    child: Opacity(
                        opacity: 0.10,
                        child: Image.asset("assets/img/group.png"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
