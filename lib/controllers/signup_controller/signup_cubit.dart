import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../custom_toast.dart';
import 'signup_state.dart';


class SignupCubit extends Cubit<SignupState> {

  SignupCubit (): super(SignupInitial());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  signup() async {
    emit(SignupLoading());
    try {
      Dio dio = Dio();
      final response = await dio.post('https://dog-health.onrender.com/api/auth/signup', data: {
        "name": '${firstNameController.text} ${lastNameController.text}',
        "username": usernameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      });





      if(response.statusCode == 200 || response.statusCode == 201){
        emit(SignupSuccess());
      }
      else{
        //await customToast('Signup failed');
        emit(SignupFailure());
      }

    } catch (e) {


      //await customToast('Signup failed');
      emit(SignupFailure());
    }
  }


}
