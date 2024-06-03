import 'package:flutter/material.dart';
import 'package:project/design/app_button.dart';
import 'package:project/design/app_image.dart';
import 'package:project/design/app_otp.dart';
class VerificationView extends StatelessWidget {
  const VerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.add_circle),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const APPImage("otp (1).png",
              height: 220
            ),
            const SizedBox(height: 24,),
            const Text("Verification",style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),) ,
            SizedBox(height: 8),
            Text("Please enter the code sent on your phone"
        ,style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor.withOpacity(.67),
            )),
            const SizedBox(height: 33,),
            AppOTP(),
            const SizedBox(height: 33,),
            AppButton(onPressed: (){},
                text:"Verify"),
          ],
        ),
      ),
    );
  }
}
