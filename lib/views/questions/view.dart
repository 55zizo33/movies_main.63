import 'package:flutter/material.dart';
class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});
  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}
class _QuestionsViewState extends State<QuestionsView> {
final list = [
  "Text",
  "Image.network",
  "Image.asset",
  "Other",
];
int selectedItem=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Questions App"),
          titleTextStyle: TextStyle(color: Colors.white,
            fontSize: 18,fontWeight: FontWeight.w700,),
          centerTitle: true,
          backgroundColor: Color(0xff3C85F2)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
            //  height: 243,
              padding: EdgeInsets.all(8),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("What is the Widget Used to Make Network Image?",style:
                  TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),),
                ...List.generate(list.length, (index) =>
                    Column(
                      children: [
                        RadioListTile(value: index,
                          controlAffinity: ListTileControlAffinity.trailing,
                          title:Text(list[index]) ,
                          contentPadding: EdgeInsets.zero,

                          groupValue: selectedItem,
                            onChanged: (value) {
                              selectedItem=value!;
                                  setState(() {});
                            },),
                        if(index==list.length-1&& index==selectedItem)
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField())
                      ],
                    )
              )
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff3C85F2).withOpacity(.22),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
