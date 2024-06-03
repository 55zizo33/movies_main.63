import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/views/products/components/products/view.dart';
import 'package:project/views/products/components/slider/view.dart';
import 'components/category_section/view.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});
  @override
  State<ProductsView> createState() => _ProductsViewState();
}
class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("منتجاتنا",style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xff16A124),
          centerTitle: true,
        ),
    body:SingleChildScrollView(
      child: Column(
          children: [
       const SliderSection(),
        SizedBox(height: 16.h,),
            const  CategorySection(),
            SizedBox(height: 16.h,),
            const  ProductsSection(),
      ]),
    ) ,
      ),
    );
  }
}



