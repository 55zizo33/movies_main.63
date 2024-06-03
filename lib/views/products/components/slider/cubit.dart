import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/dio_helper.dart';

part 'states.dart';
part 'model.dart';

class SliderCubit extends Cubit<sliderStates> {
  final DioHelper _dio;

  SliderCubit(this._dio) :super(GetSliderLoadingState());


  Future<void> getData() async {
    final response = await  _dio.get("sliders");

    if(response.isSuccess)
      {
       final list = SliderData.fromJson(response.data).list;
emit(GetSliderSuccessState(list: list));
      }else
        {
          emit(GetSliderFailedState(msg: response.message!));
        }
  }
}