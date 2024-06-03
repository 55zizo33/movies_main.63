import 'package:flutter/material.dart';
import 'package:project/design/app_image.dart';
class TravelView extends StatelessWidget {
  const TravelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff273B42),
        toolbarHeight: 100,
        flexibleSpace: Center(
          child: Row(
            children: [
              SizedBox(width: 40),
              APPImage("travel_logo.svg", height: 45, width: 45),
              SizedBox(width: 8),
              Text(
                "Travel",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffE2817A),
                ),
              ),
              Spacer(flex: 2),
              Expanded(
                child: DefaultTabController(
                  length: 4,
                  child: TabBar(
                    labelColor: Colors.white,
                    dividerHeight: 0,
                    indicatorColor: Color(0xffE2817A),
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: Colors.white,
                    tabs: [
                      Tab(
                        text: "Home",
                      ),
                      Tab(
                        text: "Store",
                      ),
                      Tab(
                        text: "Trips",
                      ),
                      Tab(
                        text: "Contact",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  fixedSize: Size.fromHeight(54),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Login"),
              ),
              SizedBox(width: 16),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: Color(0xffE2817A),
                  fixedSize: Size.fromHeight(54),
                ),
                child: Text("Sign up"),
              ),
              SizedBox(width: 24),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          APPImage(
            "travel.jpg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(.27),
          ),
  Align(
    alignment: AlignmentDirectional.centerStart,
    child: Padding(
      padding: EdgeInsetsDirectional.only(start: 24),
      child: FractionallySizedBox(
        widthFactor:.4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Adventure starts here",
              style: TextStyle(color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w700),),
            SizedBox(height: 16,),
            Text("join our exclusive group and get access to special hiking trips and receive monthly discounts",
              style: TextStyle(color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),),
            SizedBox(height: 16,),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TextFormField(
                textAlignVertical:TextAlignVertical.center ,
                decoration: InputDecoration(
                  hintText: "Enter your email here...",
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  suffixIcon:  Padding(
                    padding: const EdgeInsets.all(8),
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: Color(0xffE2817A),
                        fixedSize: Size.fromHeight(54),
                      ),
                      child: Text("Join Now"),
                                    ),
                  ),
              ),
            )
            )
          ],
        ),
      ),
    ),
  )
        ],
      ),
    );
  }
}
