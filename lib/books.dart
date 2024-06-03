import 'package:flutter/material.dart';
import 'package:project/book_details.dart'; // قم بتغيير الرابط إلى المسار الصحيح
import 'package:project/core/helper_methods.dart'; // قم بتغيير الرابط إلى المسار الصحيح
import 'package:project/design/app_image.dart'; // قم بتغيير الرابط إلى المسار الصحيح
class BooksView extends StatefulWidget {
  const BooksView({Key? key}) : super(key: key);
  @override
  State<BooksView> createState() => _BooksViewState();
}
class _BooksViewState extends State<BooksView> {
  final list = [
    BookModel(
        image:
        "https://www.noor-book.com/publice/covers_cache_webp/5/6/f/1/37c0e52fcb6f1d3f8d7171731c72f1fc.png.webp",
        title: "الداء والدواء",
        desc: "ابن القيم الجوزية"),
    BookModel(
        image:
        "https://www.noor-book.com/publice/covers_cache_webp/2/2/e/1/8414d41bac2e1649821e76fb43d9b438.jpg.webp",
        title: "تشريح تدريب القوة",
        desc: "مرجع أساسي لكمال الأجسام"),
    BookModel(
        image:
        "https://www.noor-book.com/publice/covers_cache_webp/5/6/f/1/37c0e52fcb6f1d3f8d7171731c72f1fc.png.webp",
        title: "الداء والدواء",
        desc: "ابن القيم الجوزية"),
    BookModel(
        image:
        "https://www.noor-book.com/publice/covers_cache_webp/2/2/e/1/8414d41bac2e1649821e76fb43d9b438.jpg.webp",
        title: "تشريح تدريب القوة",
        desc: "مرجع أساسي لكمال الأجسام"),
    BookModel(
        image:
        "https://www.noor-book.com/publice/covers_cache_webp/5/6/f/1/37c0e52fcb6f1d3f8d7171731c72f1fc.png.webp",
        title: "الداء والدواء",
        desc: "ابن القيم الجوزية"),
    BookModel(
        image:
        "https://www.noor-book.com/publice/covers_cache_webp/2/2/e/1/8414d41bac2e1649821e76fb43d9b438.jpg.webp",
        title: "تشريح تدريب القوة",
        desc: "مرجع أساسي لكمال الأجسام"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff333333),
      body: SafeArea(
        child: DefaultTabController(
          length: 10,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff333333),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(.25),
                    )
                  ],
                ),
                child: SafeArea(
                  child: TabBar(
                    dividerHeight: 0,
                    unselectedLabelColor: Colors.white,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                    labelStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                    unselectedLabelStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                    onTap: (value) {
                      print(value);
                    },
                    padding: const EdgeInsetsDirectional.only(
                        start: 16, top: 22, bottom: 22),
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    tabs: const [
                      Tab(text: "All"),
                      Tab(text: "Sciences"),
                      Tab(text: "UI"),
                      Tab(text: "UX"),
                      Tab(text: "Flutter1"),
                      Tab(text: "Flutter2"),
                      Tab(text: "Flutter3"),
                      Tab(text: "Flutter4"),
                      Tab(text: "Flutter5"),
                      Tab(text: "Flutter6"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 197 / 277,
                  ),
                  itemCount: list.length,
                  itemBuilder: (context, index) =>
                      _Item(model: list[index], key: ValueKey(index)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final BookModel model;
  const _Item({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(BookDetailsView(model: model));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: APPImage(
                  model.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              model.title.toUpperCase(),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            Text(
              model.desc,
              style: const TextStyle(
                  fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class BookModel {
  final String image, title, desc;
  BookModel(
      {required this.image, required this.title, required this.desc});
}
