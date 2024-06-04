import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project/core/design/app_shimmer.dart';
import 'package:project/views/products/components/category_section/cubit.dart';
part 'loading.dart';
class CategorySection extends StatefulWidget {
  const CategorySection({Key? key}) : super(key: key);
  @override
  State<CategorySection> createState() => _CategorySectionState();
}
class _CategorySectionState extends State<CategorySection> {
  final cubit = GetIt.I<CategoriesCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        if (state is GetCategoriesFailedState) {
          return Column(
            children: [
              Text(state.msg),
              FilledButton(
                onPressed: () {
                  cubit.getData();
                },
                child: Text("Try Again"),
              )
            ],
          );
        } else if (state is GetCategoriesSuccessState) {
          if (state.list.isEmpty) {
            return SizedBox.shrink();
          } else {
            return  SizedBox(
              height: 128,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "الاقسام",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) => Column(
                        children: [
                          Expanded(
                            child: Container(
                              height: 70, width: 70,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 15, width: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(9),
                            ),
                          )
                        ],
                      ),
                      separatorBuilder: (context, index) => SizedBox(width: 24),
                      itemCount: 4,
                    ),
                  ),
                ],
              ),
            );
            return Text("Categories Loaded Successfully"); // Placeholder
          }
        } else {
          return _Loading();
        }
      },
    );
  }
}