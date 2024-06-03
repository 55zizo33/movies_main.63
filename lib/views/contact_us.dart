import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project/core/helper_methods.dart';
import '../features/contact_us/bloc.dart';
class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});
  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}
class _ContactUsViewState extends State<ContactUsView> {
  final bloc = GetIt.I<ContactUsBloc>();


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: bloc.nameController,
                    decoration: InputDecoration(labelText: "الاسم")),
                SizedBox(height: 16),
                TextFormField(
                    controller: bloc.phoneController,
                    decoration: InputDecoration(labelText: "رقم الموبايل ")),
                SizedBox(height: 16),
                TextFormField(
                    controller: bloc.titleController,
                    decoration: InputDecoration(labelText: "العنوان  ")),
                SizedBox(height: 16),
                TextFormField(
                    controller: bloc.bodyController,
                    maxLines: 3,
                    decoration: InputDecoration(labelText: "الموضوع")),
                SizedBox(height: 16),
                BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if(state is SendContactUsSuccessState){
                     showMessage(state.msg,messageType: MessageType.success);
                    }else if(state is SendContactUsFailedState){
                      showMessage(state.msg);
                    }
                  },
                  builder: (context, state) {
                if( state is SendContactUsLoadingState) {
                  return Center(child: CircularProgressIndicator(),);
                } else
                  {
                    return FilledButton(onPressed: () {
                      bloc.add(SendContactUsEvent());
                    }, child: Text("إرسال"));
                  }
                    },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
