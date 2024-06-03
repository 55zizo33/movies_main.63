import 'package:flutter/material.dart';
import 'package:project/core/helper_methods.dart';
import 'package:project/core/logic/cache_helper.dart';
import 'package:project/design/app_image.dart';
import 'package:project/main.dart';
import 'package:project/views/login.dart';

import 'login/view.dart';
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}
class _OnBoardingViewState extends State<OnBoardingView> {
  int currentPage=1;
  List<String> title =[
    "Feel Free",
    "Ask For Anything",
    "Your Secert is Save",];
  List<String> desc =[
    "because I'm the friendly chatbot here to assist you with anything you need.",
    "I'm your friendly neighborhood chatbot ready to assist you with any questions or concerns.",
    "Our platform prioritizes your privacy and security",];
  final pageController=PageController();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*.65,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller:pageController ,
                onPageChanged: (value) {
                  print(value);
                  currentPage=value+1;
                  setState(() {
                  });
                },
                itemBuilder: (context, index) =>
                  APPImage("on_boarding${index+1}.jpg",
                fit:BoxFit.fill ,
              ),itemCount: title.length,
              ),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start ,
                children: [   Text(
                  title[currentPage-1],style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700
                ),),
                  SizedBox(height: 24,),
                  Text(desc[currentPage-1]
                    ,style: TextStyle(
                      fontSize: 22,
                    ),),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                    children: [
                      if(currentPage!=3)
                        TextButton(onPressed: (){
                          CacheHelper.setNotFirstTime();
                          navigateTo(LoginView(),keepHistory: false);
                        }, child: Text("Skip")),
                      Spacer(),
                      FloatingActionButton(onPressed: (){
                        if(currentPage<3)
                        {
                          pageController.nextPage(
                            duration: Duration(seconds: 1)
                              , curve: Curves.linear,
                          );
                        }else {
                          navigateTo(LoginView(),keepHistory: false);
                        }
                        currentPage++;
                        setState(() {
                        });
                      },child:Icon(Icons.ac_unit_rounded,size: 32) ,)
                    ],
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
