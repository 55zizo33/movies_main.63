import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/dio_helper.dart';
part 'states.dart';
part 'events.dart';
class ContactUsBloc extends Bloc<ContactUsEvents,ContactUsStates> {
  final DioHelper _dio;

  ContactUsBloc(this._dio):super(ContactUsStates()){
    on<SendContactUsEvent>(_sendData);
  }
  
  final nameController =TextEditingController(text: "Ahmed");
  final phoneController=TextEditingController(text: "025446");
  final titleController=TextEditingController(text: "ghrrr");
  final bodyController=TextEditingController(text: "fgttgtftg");

Future<void> _sendData(
    SendContactUsEvent event,
    Emitter<ContactUsStates>emit,
    ) async{
  emit(SendContactUsLoadingState());
  final response = await _dio.send("contact",data: {
    "fullname":nameController.text,
    "phone":phoneController.text,
    "title":titleController.text,
    "content":bodyController.text,
  });
  if(response.isSuccess)
  {
    emit(SendContactUsSuccessState(msg: "success"));
  }else
  {
    emit(SendContactUsFailedState(msg: response.message!));
  }
}
}