import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:project/core/design/app_shimmer.dart';
import 'cubit.dart';
part 'loading.dart';

class SliderSection extends StatefulWidget {
  const SliderSection({Key? key}) : super(key: key);
  @override
  State<SliderSection> createState() => _SliderSectionState();
}

class _SliderSectionState extends State<SliderSection> {
  int currentIndex = 0;

  final cubit = GetIt.I<SliderCubit>(); // تأكد من أن SliderCubit معرف ومستورد بشكل صحيح

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        if (state is GetSliderFailedState) {
          return Text("Failed");
        } else if (state is GetSliderSuccessState) {
          return Container(
            height: 232.h,margin: EdgeInsets.symmetric(horizontal: 16.w)
              .copyWith(top: 16.h),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.grey,
                    ),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayInterval: Duration(seconds: 3),
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                      itemBuilder: (context, index, realIndex) => Image.network(
                        state.list[index].image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      itemCount: state.list.length,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    state.list.length,
                        (index) => Padding(
                      padding: EdgeInsetsDirectional.only(
                          end: index != state.list.length - 1 ? 8.w : 0),
                      child: CircleAvatar(
                        radius: 6.r,
                        backgroundColor: Color(0xff16A124).withOpacity(
                            index == currentIndex ? 1 : 0.1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return _Loading();
        }
      },
    );
  }
}

