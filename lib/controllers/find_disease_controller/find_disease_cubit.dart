import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../custom_toast.dart';
import '../../models/find_diease_model.dart';
import 'find_disease_state.dart';

class FindDiseaseCubit extends Cubit<FindDiseaseState> {
  FindDiseaseCubit() : super(FindDiseaseInitialState());

  void findDisease(String age, List causes) async {
    emit(FindDiseaseLoadingState());
    try {
      Dio dio = Dio();

      final String causesString = causes.join(',');



      final response = await dio.get(
          'https://dog-health.onrender.com/api/dog/find',
          queryParameters: {
            'causes': causesString,
            'age': age,
          });


      if (response.statusCode == 200 || response.statusCode == 201) {
        final FindDisease findDisease = FindDisease.fromJson(response.data);

        emit(FindDiseaseSuccessState(findDisease));
      } else {
        await customToast('Something went wrong');

        emit(FindDiseaseFailureState());
      }
    } catch (e) {
      await customToast('Something went wrong');

      emit(FindDiseaseFailureState());
    }
  }
}
