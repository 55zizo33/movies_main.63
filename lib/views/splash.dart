import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:project/core/helper_methods.dart';
import 'package:project/core/logic/cache_helper.dart';
import 'package:project/views/login.dart';
import 'package:project/views/on_boarding.dart';

import 'login/view.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds:3 ),(){
      navigateTo(
          CacheHelper.isFirstTime? OnBoardingView():LoginView(),
          keepHistory: false,
          );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Spin
        (
          child: CircleAvatar(
            radius: 180,
            backgroundColor: const Color(0xff284243).withOpacity(.3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Tranquility",
                  style: TextStyle(fontSize: 48,fontFamily:"Courgette"
                      ,color:Theme.of(context).primaryColor), // تم تقليل حجم النص هنا
                ),
                const SizedBox(height: 4),
                Text(
                  "Together Towards Tranquility",
                  style: TextStyle(fontSize: 20,
                      color:Theme.of(context).primaryColor.withOpacity(.57)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
