
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/dio_helper.dart';
import 'package:project/views/terms/model.dart';
import 'package:project/views/terms/states.dart';
final dio = DioHelper();

class TermsCubit extends Cubit<TermsStates> {
  final DioHelper _dio;
  TermsCubit(this._dio) :super(GetTermsLoadingState());
//late TermsModel model;
  Future<void> getData() async {
    final response = await _dio.get("terms");
    if (response.isSuccess) {
     final  model =TermsData.fromJson(response.data).model ;
      emit(GetTermsSuccessState(model: model));
    } else {
      emit(GetTermsFailedState(msg:response.message!));
    }
  }
}




