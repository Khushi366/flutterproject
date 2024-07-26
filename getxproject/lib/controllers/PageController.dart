import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class DataController extends GetxController
{
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();


  TextEditingController roll = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController s1 = TextEditingController();
  TextEditingController s2 = TextEditingController();
  TextEditingController s3 = TextEditingController();

  var rollNo = "".obs;
  var names = "".obs;
  var total = "0".obs;
  var per = "0".obs;
  var gred = "0".obs;

  add(){
    var t = int.parse(num1.text.toString()) +  int.parse(num2.text.toString());
    total.value = t.toString();

  }

  sub(){
    //sub
    var s = int.parse(num1.text.toString()) - int.parse(num2.text.toString());
    total.value = s.toString();
  }

  mul()
  {
    //multi
    var m = int.parse(num1.text.toString()) * int.parse(num2.text.toString());
    total.value = m.toString();
  }

  div(){
    //divided
    var d = int.parse(num1.text.toString()) / int.parse(num2.text.toString());
    total.value = d.toString();

  }

  //student result
  student(){

    rollNo.value = roll.text.toString();
    names.value = name.text.toString();


    var t = int.parse(s1.text.toString()) +  int.parse(s2.text.toString()) +  int.parse(s3.text.toString());
    total.value = t.toString();

    var p = t/3.0;
    per.value = p.toStringAsFixed(2);

    if(p>=75)
    {
      gred.value = "Distinction";
    }else if (p >= 60) {
      gred.value = "First Class";
    } else if (p >= 50) {
      gred.value = "Second Class";
    } else if (p >= 35) {
      gred.value = "Pass Class";
    } else {
      gred.value = "Fail";
    }

  }


}


