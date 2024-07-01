import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../custom_toast.dart';
import '../../models/clinic_model.dart';
import 'clinic_state.dart';

class ClinicCubit extends Cubit<ClinicState> {
  ClinicCubit() : super(ClinicInitial());

   getClinic(String city) async {
    emit(ClinicLoading());
    try {
      Dio dio = Dio();


      final response = await dio.get(
          'https://dog-health.onrender.com/api/dog/find_clinic',
          queryParameters: {
            'city': city,

          });


      if (response.statusCode == 200 || response.statusCode == 201) {
        final ClinicModel clinicModel = ClinicModel.fromJson(response.data);

        emit(ClinicSuccess(clinicModel));
      } else {
        await customToast('Something went wrong');

        emit(ClinicFailure());
      }
    } catch (e) {
      await customToast('Something went wrong');

      emit(ClinicFailure());
    }
  }
}