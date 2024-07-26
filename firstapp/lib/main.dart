import 'package:firstapp/CardExample.dart';
import 'package:firstapp/ContainerWidgetExample.dart';
import 'package:firstapp/LoginScreen.dart';
import 'package:firstapp/SecondScreenExample.dart';
import 'package:firstapp/TextWidgetExample.dart';
import 'package:firstapp/test.dart';
import 'package:flutter/material.dart';

import 'ActionBarExample.dart';
import 'AdditionSharedPreferencesExample.dart';
import 'AlertDialogAndTtfExample.dart';
import 'BankPinCreatExample.dart';
import 'BottomNavigationExample.dart';
import 'BottomSheetExample.dart';
import 'ButtonScreen.dart';
import 'ButtonsExample.dart';
import 'CheckBoxExample.dart';
import 'CustomBottomNavigationExample.dart';
import 'DialerScreen.dart';
import 'DrawerExample.dart';
import 'EmployeeStateMagement.dart';
import 'ExpandedExample.dart';
import 'FirstScreenExample.dart';
import 'GridviewExample.dart';
import 'HorizontalListviewExample.dart';
import 'HraStateManagement.dart';
import 'HraTextfield.dart';
import 'ImageExample.dart';
import 'ListViewExample.dart';
import 'RadioButtonExample.dart';
import 'RadioButtonScreen.dart';
import 'RegisterScreen.dart';
import 'RegisterformSnackBarScreen.dart';
import 'RemainStateManagement.dart';
import 'RichTextExample.dart';
import 'SharedPreferenceExample.dart';
import 'SplaceScreenExample.dart';
import 'StackExample.dart';
import 'StateManagementCalculation.dart';
import 'StateManagementStudent.dart';
import 'StatemanagementExample.dart';
import 'StudentNavigationsScreen.dart';
import 'StudentResultTexformfiled.dart';
import 'TableWidgetExample.dart';
import 'TabsAndPopupMenuExample.dart';
import 'TextFormFieldExample.dart';
import 'TextfieldsExample.dart';
import 'TextfiledScreen.dart';
import 'TextfiledScreenSecond.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnlineShopping',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
       useMaterial3: false,
      ),
      //home:  DataTablePage(),
      home:  DataTablePage(),
      // routes: {
      //   "/second": (context) => SecondScreenExample(),
      //   "/first": (context) => SecondScreenExample(),
      //   "/register": (context) => RegisterScreen(),
      // },
    );
  }
}
