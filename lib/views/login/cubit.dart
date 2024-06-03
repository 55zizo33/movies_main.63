import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project/views/login/states.dart';
import '../../core/dio_helper.dart';
import '../products/view.dart';
final dio =  GetIt.I<DioHelper>();

class LoginCubit extends Cubit<LoginStates>
{
final  DioHelper _dio;
  LoginCubit(this._dio):super(LoginStates());

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> send(context) async {
    emit(LoginStates());
    final response = await _dio.send("login", data: {
      "phone": phoneController.text,
      "password": passwordController.text,
      "device_token": "test",
      "type": Platform.operatingSystem,
      "user_type": "client",
    });
    if (response.isSuccess) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductsView()),
      );
      emit(LoginSuccessState());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.message!)),
      );
      emit(LoginFailedState());
    };
  }
}