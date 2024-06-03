import 'package:flutter/material.dart';
import 'package:project/design/app_button.dart';
import 'package:project/design/app_image.dart';
import 'package:project/design/app_input.dart';
class changePasswordView extends StatelessWidget {
  const changePasswordView({super.key});
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
            const Text("Change Your Password",style: TextStyle(
              fontSize: 24,
            )),
            const SizedBox(height: 33,),
             const AppInput(label: "Old Password",
            isPassword:true,),
            const AppInput(label: "New Password",
              isPassword:true,),
            const AppInput(label: "Confirm New Password",
              isPassword:true,),
            const SizedBox(height: 16,),
            AppButton(onPressed: (){
              //navigateTo(VerificationView());
            },
                  text:"Change Password"),
          ],
        ),
      ),
    );
  }
}
