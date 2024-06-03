import 'package:flutter/material.dart';
import 'package:project/core/helper_methods.dart';
import 'package:project/design/app_image.dart';
import 'package:project/views/about_us.dart';
import 'package:project/views/assistant.dart';
import 'package:project/views/home/pages/chats.dart';
import 'package:project/views/home/pages/profile.dart';
import 'package:project/views/home/pages/quotes.dart';
import 'package:project/views/login.dart';

import '../login/view.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewViewState();
}
class _HomeViewViewState extends State<HomeView> {
  List<String> icons = ["chat.svg", "quotes.svg", "profile.svg"];
  List<Widget> pages = [ChatsPage(),
    QuotesPage(),
    ProfilePage()];
  List<String> titles = ["Chat", "Quotes", "Profile"];
  int currentIndex = 0;
  bool isEasyLogin=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentIndex==2? "Edit Profile":
        titles[currentIndex]),),
      extendBodyBehindAppBar:currentIndex==1 ,
      body: pages[currentIndex],
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 31),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25)),
              ),
                child: SafeArea(
                  child: Column(
                    children: [
                  ClipOval(
                    child: APPImage(profileImage,height: 160
                        , width: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("Solo",style: TextStyle(fontSize: 16,color: Colors.white)),
                    SizedBox(height: 4,),
                    Text("01027545631",style: TextStyle(fontSize: 16,color: Colors.white)),
                                ],
                              ),
                ),
            ),
            SizedBox(height: 24,),
                 Container(
                  margin: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
                  padding: EdgeInsets.all(16),
                  decoration:  BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      APPImage("about_us.svg",height: 24,width: 24,),
                      SizedBox(width: 2.5,),
                      Text("About Us",style: TextStyle(fontSize: 16)),
                    ],
                  ),
                                 ),
            GestureDetector(
              onTap: ()async{
             await   openUrl("https://play.google.com/store/apps/details?id=com.tencent.ig&hl=ar&gl=US");
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
                padding: EdgeInsets.all(16),
                decoration:  BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    APPImage("rate.svg",height: 24,width: 24,),
                    SizedBox(width: 2.5,),
                    Text("Rate Our App",style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
                padding: EdgeInsets.all(16),
                decoration:  BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    APPImage("suggestions.svg",height: 24,width: 24,),
                    SizedBox(width: 2.5,),
                    Text("Suggestions",style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                navigateTo(AboutUsView());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
                padding: EdgeInsets.all(16),
                decoration:  BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    APPImage("easy_login.svg",height: 24,width: 24,),
                    SizedBox(width: 2.5,),
                    Expanded(child: Text("Enable Easy Login",style: TextStyle(fontSize: 16))),
                    SizedBox(width: 10,),
                    SizedBox(width: 25,),
                    Switch(
                      value:isEasyLogin ,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) {
                      print(value);
                      isEasyLogin=value;
                      setState(() {
                      });
                    },),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                navigateTo(LoginView(),keepHistory: false);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
                padding: EdgeInsets.all(16),
                decoration:  BoxDecoration(
                  color: Color(0xffFF3A3A).withOpacity(.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    APPImage("logout.svg",height: 24,width: 24,),
                    SizedBox(width: 2.5,),
                    Text("Logout",style: TextStyle(fontSize: 16,color: Color(0xffF60000))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          navigateTo(AssistantView());
        },
        child: APPImage("chat_bot.svg",color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          print(value);
          setState(() {
            currentIndex = value;
          });
        },
        items: List.generate(
          icons.length,
              (index) => BottomNavigationBarItem(
            icon: APPImage(
              icons[index],
              color: Colors.white.withOpacity(.3),
            ),
            activeIcon: APPImage(
              icons[index],
              color: Colors.white,
            ),
            label: titles[index], // Use titles here
          ),
        ),
      ),
    );
  }
}
