import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:project/core/design/app_shimmer.dart';
import 'package:project/views/products/components/products/cubit.dart';
part '../item_product.dart';
part 'loading.dart';
class ProductsSection extends StatefulWidget {
  const ProductsSection({super.key});
  @override
  State<ProductsSection> createState() => _ProductsSectionState();
}
class _ProductsSectionState extends State<ProductsSection> {
  final cubit = GetIt.I<ProductsCubit>();
  @override
  Widget build(BuildContext context) {
      return BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if(state is GetProductsFailedState){
            return Text("Failed");
            }else if (state is GetProductsSuccessState) {
                return   GridView.builder(
                  padding:const EdgeInsets.all(16),
                  physics:const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:state.list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 20,
                    childAspectRatio: 189 / 300,
                  ),
                  itemBuilder: (context, index) =>
                      _Item(model:state.list[index],),
                );
              }else{
          return _Loading();
          }
        },);
    }
  }




