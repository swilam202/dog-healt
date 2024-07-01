import '../../models/clinic_model.dart';

abstract class ClinicState{}

class ClinicInitial extends ClinicState{}
class ClinicLoading extends ClinicState{}
class ClinicFailure extends ClinicState{}
class ClinicSuccess extends ClinicState{
  final ClinicModel clinic;
  ClinicSuccess( this.clinic);
}
