import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project/views/login/states.dart';
import '../../core/logic/input_validator.dart';
import '../../design/app_button.dart';
import '../../design/app_image.dart';
import '../../design/app_input.dart';
import '../forget_password.dart';
import 'cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final cubit = GetIt.I<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: cubit.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 52),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const APPImage(
                  "login.png",
                  height: 220,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Tranquility",
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: "Courgette",
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                AppInput(
                  label: "PhoneNumber",
                  controller: cubit.phoneController,
                  validator: InputValidator.phone,
                  keyboardType: TextInputType.phone,
                ),
                AppInput(
                  label: "Password",
                  controller: cubit.passwordController,
                  // validator: InputValidator.password,
                  isPassword: true,
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgetPasswordView()),
                      );
                    },
                    child: const Text("Forget Password?"),
                  ),
                ),
                BlocBuilder(
                  bloc: cubit,
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return AppButton(
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.send(context);
                          }
                        },
                        text: "Log In",
                      );
                    }
                  },
                ),
                const SizedBox(height: 24),
                Center(child: CircularProgressIndicator()),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account ?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Sign up"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
   // return Builder(
     // builder: (context) {
     // },
   // );
  }
}
