import 'package:flutter/material.dart';
import 'package:project/core/helper_methods.dart';
import 'package:project/design/app_button.dart';
import 'package:project/design/app_image.dart';
import 'package:project/design/app_input.dart';
import 'package:project/views/verification.dart';
class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
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
          const APPImage("forget_password.png",
          height: 220,
        ),
        const SizedBox(height: 24,),
            const Text("Forget Password",style: TextStyle(
              fontSize: 24,
            )),
            const SizedBox(height: 16,),
             const AppInput(label: "PhoneNumber",
                keyboardType:TextInputType.phone ),
            const SizedBox(height: 33,),
            AppButton(onPressed: (){
              navigateTo(VerificationView());
            },
                  text:"Forget Password"),
          ],
        ),
      ),
    );
  }
}
