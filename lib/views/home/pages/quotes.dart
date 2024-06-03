import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:project/core/helper_methods.dart';
import 'package:project/design/app_image.dart';
class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  final list =[
    QuoteModel(text: "The only way to do great work is to love what you do", author:
    "author"),
    QuoteModel(text: "The greatest glory in living lies not in never falling, but in rising every time we fall.", author: "author"),
    QuoteModel(text: "The only impossible journey is the one you never begin.", author: "author"),
    QuoteModel(text: "text", author: "author"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        alignment: Alignment.center,
        children: [
          APPImage(
            "quotes.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xffD9D9D9).withOpacity(.5),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/2,
            child: PageView.builder(itemBuilder: (context, index) => Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 36),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    APPImage("ic_quotes.svg"),
                    SizedBox(height: 16),
                    Text(
                      "“ ${list[index].text} “",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Center(
                        child: Text(
                          "list[index].author",
                          style: TextStyle(
                            fontSize: 34,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    TextButton(
                      onPressed: () {
                        FlutterClipboard.copy('list[index].text').then(
                                ( value ) {
                              showMessage("Text Copied Success");
                            });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [Text("copy"),
                          SizedBox(width: 8,),
                          APPImage("copy.svg"),
                        ],
                      ),
                    )
                  ],
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white.withOpacity(.81),
                ),
              ),
            ),itemCount: list.length,),
          )

        ],
      ),
    );
  }
}
class QuoteModel {
  final String text , author ;
  QuoteModel({required this.text, required this.author});

}