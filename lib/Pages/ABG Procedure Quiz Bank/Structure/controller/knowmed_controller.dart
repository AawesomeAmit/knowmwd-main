

import '../data_model/knowmedResult.dart';
import '../data_model/knowmed_data_model.dart';
import 'package:get/get.dart';
class KnowMed_Controller extends GetxController{

  RxString optionTap = ''.obs;
  RxString questionId = ''.obs;
  RxString examId = ''.obs;
  RxString ratingFeedback = ''.obs;
  RxString feedbackOptionSelect = ''.obs;
  RxString feedbackWritten = ''.obs;
  RxDouble correctWidth = 0.0.obs;
  RxDouble incorrectWidth = 0.0.obs;
  RxDouble notVisitedWidth = 0.0.obs;
  double multiple = 0.0;

  List options_data = [].obs;
  List colors_data = [].obs;
  List examDashboardList = [].obs;
  List resultData = [].obs;


  RxBool showNoData=false.obs;
  bool get getShowNoData=>(showNoData.value);
  set updateShowNoData(bool val){
    showNoData.value=val;
    update();
  }


  List<OptionList> get getQuestionsData=>List<OptionList>.from(
      (
          options_data
              .map((element) => OptionList.fromJson(element))
      ));

  List<Colors_list> get getColorsData=>List<Colors_list>.from(
      (
          colors_data
              .map((element) => Colors_list.fromJson(element))
      ));

  List<ExamDashBoard> get getExamBoardData=>List<ExamDashBoard>.from(
      (
          examDashboardList
              .map((element) => ExamDashBoard.fromJson(element))
      ));


  List<KnowMedResult> get getResultsData=>List<KnowMedResult>.from(
      (
          resultData
              .map((element) => KnowMedResult.fromJson(element))
      ));




  set updateQuestionsData(Map val){
    options_data=val['optionList'];
    colors_data=val['symbolList'];
    examDashboardList=val['examDashboardList'];
    update();
  }

  set updateExamDashboardList(List val){
    examDashboardList=val;
    update();
  }

  set updateResultList(List val){
    resultData=val;
    update();
  }

}