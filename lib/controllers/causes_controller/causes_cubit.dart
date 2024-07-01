import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/models/causes_model.dart';

import '../../custom_toast.dart';
import 'causes_state.dart';

class CausesCubit extends Cubit<CausesState> {

  CausesCubit() : super(CausesInitial());

  List<CausesModel> causes = [];

  getCauses() async {

    emit(CausesLoading());

    try {
      Dio dio = Dio();
      final response = await dio.get('https://dog-health.onrender.com/api/dog/list_causes');


      if(response.statusCode == 200 || response.statusCode == 201){
        final List<CausesModel> causesList = (response.data as List).map((i) => CausesModel.fromJson(i)).toList();
        causes.clear();
        causes.addAll(causesList);
        emit(CausesSuccess());
      }
      else{
        await customToast('Something went wrong');
        emit(CausesFailure());
      }

    } catch (e) {
      await customToast('Something went wrong');
      emit(CausesFailure());
    }
  }
}
