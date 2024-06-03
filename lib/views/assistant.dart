import 'package:flutter/material.dart';
import 'package:project/design/app_button.dart';
import 'package:project/design/app_image.dart';
import 'package:project/design/app_input.dart';
class AssistantView extends StatelessWidget {
  const AssistantView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsetsDirectional.only(top: 106,bottom: 23,start: 20,end: 20),
        height: 399,
              child: Column(
                children: [
                  APPImage("Vector.svg",color: Theme.of(context).primaryColor,height: 157,width: 157,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 16,),
                  Text("Hey!",style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w900
                  )),
                  SizedBox(height: 8,),
                  Text("I’am your Personal Assistant",style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500
                  )),
                ],
              ),
              color: Theme.of(context).primaryColor.withOpacity(.15),
            ),
            SizedBox(height: 48,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 24),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 Text("Make New Chat",
                     style: TextStyle(
                         fontSize: 25,
                         color: Theme.of(context).primaryColor,
                         fontWeight: FontWeight.w500
                     )),
                 SizedBox(height: 16,),
                 AppInput(label: "title",hint: "Enter The Title Of Chat",),
                 SizedBox(height: 8,),
                 AppButton(onPressed: (){},
                   text: ("Start Chat"),
                 ),

               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}
