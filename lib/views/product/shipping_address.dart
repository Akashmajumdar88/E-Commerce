import 'package:account/constants/app_styles.dart';
import 'package:account/widgets/common_field.dart';
import 'package:flutter/material.dart';

class ShippingAddress extends StatelessWidget {
  ShippingAddress({Key? key}) : super(key: key);
  TextEditingController dd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Address",style: AppStyles().appBarStyle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CommonField(
                controller: dd,
                keyboardType: TextInputType.text,
                hintText: "")
          ],
        ),
      ),
    );
  }
}
