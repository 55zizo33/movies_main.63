import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/design/app_image.dart';
class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);
  @override
  State<ChatsPage> createState() => _ChatsPageState();
}
class _ChatsPageState extends State<ChatsPage> {
late  List<ChatModel> list  ;
  bool isLoading=true;
 Future<void> getData()async{
    await Future.delayed(Duration(seconds: 5));
  list=  [
   ChatModel(title: "About Work", date: "10/12/2021"),
   ChatModel(title:  "About My Family", date:  "10/12/2021"),
   ChatModel(title:   "My self", date:  "10/12/2021"),
   ];
    isLoading=false;

    setState(() {
    });
  }
  @override
void initState(){
   super.initState();
   getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:isLoading?
      Center(child: CupertinoActivityIndicator(radius: 50,color: Colors.red),)
          :list.isEmpty
        ?
      Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [APPImage(
            "chat_bot.svg",height:200
            ,width:200 ,
            fit: BoxFit.fill,
            color: Theme.of(context).primaryColor),
          SizedBox(height: 8,),
          Text("list[index].text",style: TextStyle(
              fontSize: 20
          ),),
        ],
      ),)
          :ListView.separated(
        padding: EdgeInsets.all(16),
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemCount: list.length,
        itemBuilder: (context, index) => Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).primaryColor.withOpacity(.1),
                  border: Border.all(color: Colors.black),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      list[index].title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      list[index].date,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  list.removeAt(index);
                });
              },
              icon: APPImage("delete.svg", color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
class ChatModel {
  final String title , date;
  ChatModel({required this.title,required this.date});
}
