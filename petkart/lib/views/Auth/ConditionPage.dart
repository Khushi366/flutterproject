import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petkart/Theme/DeviceLayout.dart';

class ConditionsPage extends StatelessWidget {
  const ConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isTablet = DeviceLayout.isTablet(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            width: isTablet ? 800.0 : double.infinity,
            child: Column(
              children: [
                SizedBox(height: isTablet ? 50.0 : 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_ios_new_outlined)),
                    SizedBox(width: 30.0),
                    Text("Terms & Conditions", style: Get.textTheme.headlineSmall),
                  ],
                ),
                SizedBox(height: 30.0),

                Text("By using the PetKart app, you agree to comply with"
                    " and be bound by these terms and conditions. "
                    "If you do not agree, please refrain from using our services."
                    " PetKart reserves the right to modify these terms at any time,"
                    " and continued use of the app signifies acceptance of any changes.", style: Get.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),textAlign: TextAlign.justify,),
                SizedBox(height: 20.0),

                Text("PetKart provides a platform for purchasing "
                    "pet products and arranging delivery services. "
                    "Users must ensure that the information provided during "
                    "registration is accurate and up-to-date. Misuse of the platform,"
                    " including fraudulent activity, is strictly prohibited"
                    " and may result in account suspension.", style: Get.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),textAlign: TextAlign.justify,),

                SizedBox(height: 20.0),

                Text("All orders placed through PetKart are subject to product"
                    " availability and confirmation of payment. Prices are"
                    " subject to change without notice, but once an order "
                    "is placed, the price is locked in. Payments must be "
                    "made through the secure methods provided in the app,"
                    " and all transactions are final.", style: Get.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),textAlign: TextAlign.justify,),
                SizedBox(height: 20.0),

                Text("PetKart strives to ensure accurate product information"
                    " and prompt delivery; however,"
                    " we are not liable for any delays or inaccuracies."
                    " Users accept that PetKart is not responsible for any"
                    " indirect or consequential damages arising from"
                    " the use of our services. If issues arise, "
                    "please contact customer support for resolution.", style: Get.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),textAlign: TextAlign.justify,),

                SizedBox(height: 20.0),

                Text("Orders can be placed through the app, and payments"
                    " must be made using the secure methods provided."
                    " Once an order is placed, you will receive a "
                    "confirmation. All sales are final,"
                    " and payment must be completed to process the order.", style: Get.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),textAlign: TextAlign.justify,),

                SizedBox(height: 20.0),

                Text("We offer reliable delivery services within specified areas."
                    " Delivery times are estimates and may vary due to unforeseen"
                    " circumstances. PetKart is not liable for any delays,"
                    " but we will do our best to keep you informed.", style: Get.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),textAlign: TextAlign.justify,),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
