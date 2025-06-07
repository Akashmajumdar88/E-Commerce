import 'package:account/widgets/common_button.dart';
import 'package:account/widgets/common_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../constants/app_styles.dart';
import '../providers/cibil_provider.dart';

class CibilCheck extends StatelessWidget {
  CibilCheck({super.key});
  final TextEditingController panController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final cibilProvider = Provider.of<CibilProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("CIBIL Score Check",style: AppStyles().appBarStyle)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonField(
                controller: panController,
                keyboardType: TextInputType.text,
                hintText: "Enter PAN Number"),
            const SizedBox(height: 20),
            CommonButton(
                width: size.width,
                height: size.height * 0.06,
                onPressed: () {
                  cibilProvider.checkCibil(panController.text);
                },
                title: "Check CIBIL Score"),
            const SizedBox(height: 20),
            if (cibilProvider.isLoading)
              const CircularProgressIndicator()
            else if (cibilProvider.cibilScore != null)
              Text(
                "Your CIBIL Score: ${cibilProvider.cibilScore}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            else if (!cibilProvider.isLoading && cibilProvider.cibilScore == null)
                const Text("Invalid PAN Number!",
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
          ],
        ),
      ),
    );
  }
}