import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:project/views/login.dart';
import 'package:project/views/login/view.dart';
class NewOnBoardingView extends StatefulWidget {
  const NewOnBoardingView({super.key});
  @override
  State<NewOnBoardingView> createState() => _NewOnBoardingViewState();
}
class _NewOnBoardingViewState extends State<NewOnBoardingView> {
  final  list = [
    Introduction(
      title: 'Buy & Sell',
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/images/on_boarding1.jpg',
    ),
    Introduction(
      title: 'Delivery',
      subTitle: 'Your order will be immediately collected and',
      imageUrl: 'assets/images/on_boarding2.jpg',
    ),
    Introduction(
      title: 'Receive Money',
      subTitle: 'Pick up delivery at your door and enjoy groceries',
      imageUrl: 'assets/images/on_boarding3.jpg',
    ),
    Introduction(title: 'Finish',
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/images/on_boarding1.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          ), //MaterialPageRoute
        );
      },
    );
  }
}




