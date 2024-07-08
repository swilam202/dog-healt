import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );

      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        await customToast('No user found for that email.');
      } else if (e.code == 'wrong-password') {

        await customToast('Wrong password provided for that user.');

      }
      emit(LoginFailure());
    }
    catch (e) {
      await customToast(e.toString());
      emit(LoginFailure());
    }
    // try {
    //   Dio dio = Dio();
    //   final response = await dio.post('https://dog-health.onrender.com/api/auth/signin', data: {
    //     'usernameOrEmail': emailController.text,
    //     'password': passwordController.text,
    //   });
    //
    //
    //
    //
    //   if(response.statusCode == 200 || response.statusCode == 201){
    //     emit(LoginSuccess());
    //   }
    //   else{
    //     await customToast('Login failed');
    //     emit(LoginFailure());
    //   }
    //
    // } catch (e) {
    //   await customToast('Login failed');
    //   emit(LoginFailure());
    // }
  }
}
