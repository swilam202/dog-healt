import '../../models/find_diease_model.dart';

abstract class FindDiseaseState{}

class FindDiseaseInitialState extends FindDiseaseState{}
class FindDiseaseLoadingState extends FindDiseaseState{}
class FindDiseaseSuccessState extends FindDiseaseState{
  final FindDisease findDisease ;
  FindDiseaseSuccessState(this.findDisease);
}
class FindDiseaseFailureState extends FindDiseaseState{

}