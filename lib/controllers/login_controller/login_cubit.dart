import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/custom_toast.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  LoginCubit (): super(LoginInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

   login() async {
    emit(LoginLoading());
    try {
      Dio dio = Dio();
      final response = await dio.post('https://dog-health.onrender.com/api/auth/signin', data: {
        'usernameOrEmail': emailController.text,
        'password': passwordController.text,
      });




      if(response.statusCode == 200 || response.statusCode == 201){
        emit(LoginSuccess());
      }
      else{
        await customToast('Login failed');
        emit(LoginFailure());
      }

    } catch (e) {
      await customToast('Login failed');
      emit(LoginFailure());
    }
  }
}
