import 'package:flutter/material.dart';
import 'package:project/design/app_image.dart';
class WhatsAppView extends StatefulWidget {
  const WhatsAppView({Key? key}) : super(key: key);
  @override
  State<WhatsAppView> createState() => _WhatsAppViewState();
}
class _WhatsAppViewState extends State<WhatsAppView>
    with SingleTickerProviderStateMixin {
  late TabController tapController;
  @override
  void initState() {
    super.initState();
    tapController = TabController(length: 4, vsync: this, initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff333333),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: APPImage("search (1).svg")),
          IconButton(onPressed: () {}, icon: APPImage("more.svg"))
        ],
        title: Text("WhatsApp",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xff9EA2A6))),
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
                dividerHeight: 0,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight:4 ,
                indicatorColor:Color(0xff08B09E) ,
                controller: tapController,
                labelColor: Color(0xff08B09E),
                unselectedLabelColor: Color(0xff9EA2A6),
                labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                tabs: [
                  APPImage("camera.svg"),
                  Tab(
                    text: "Chats",
                  ),
                  Tab(
                    text: "STATUS",
                  ),
                  Tab(
                    text: "CALLS",
                  ),
                ]),
            Expanded(child: ListView.separated(
              itemCount: 10,
              padding: EdgeInsets.symmetric(vertical: 16),
              separatorBuilder: (context, index) => SizedBox(height: 2),
                itemBuilder: (context, index) => ListTile(
                  onTap: (){

                  },
                  dense: true,
                  horizontalTitleGap: 10,
                  selectedColor: Color(0xff08B09E),
                  titleTextStyle:TextStyle(color: Colors.white,
                    fontSize: 13,fontWeight: FontWeight.w500,
                  ),
                  leading: ClipOval(child:
                  APPImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTscsWbu_CDxADl9MoewnARNocacMR63poR8w&s",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,

                  )),
                  title: Text(
                    "Ahmed Sobhey",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    ),
                  subtitle: Text(
                    "Hello World",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white,
                    fontSize: 10,fontWeight: FontWeight.w500,
                  ),
                  ),
                  trailing: Text("10/12/2021",style: TextStyle(color: Color(0xff9EA2A6),
                    fontSize: 10,fontWeight: FontWeight.w500,
                  ),),
                )))
          ],
        ),
      ),
    );
  }
}
