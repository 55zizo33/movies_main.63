import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class AppOTP extends StatelessWidget {
  const AppOTP({super.key});
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(appContext: context,
        backgroundColor: Colors.transparent,
        keyboardType:TextInputType.number ,
        cursorColor: Theme.of(context).primaryColor,
        pinTheme:PinTheme(
          shape: PinCodeFieldShape.box,
          activeColor: Theme.of(context).primaryColor,
          selectedColor:Theme.of(context).primaryColor ,
          inactiveColor:Theme.of(context).primaryColor.withOpacity(.29) ,
          activeFillColor: Colors.red,
          inactiveFillColor: Colors.cyanAccent,
          selectedFillColor: Colors.green,
          fieldHeight: 60,
          fieldWidth: 70,
          borderRadius: BorderRadius.circular(8),
        ) ,
        length: 4);
  }
}
