import 'package:get/get.dart';
import 'package:knowmed_flutter/Modal/result.dart';

class ResultController extends GetxController{
  RxBool showNoData=false.obs;
  List userStatistics=[].obs;
  UserStatistic get getUserStatistics=>UserStatistic.fromJson(userStatistics.isEmpty?{}:userStatistics[0]);
  bool get getShowNoData=>showNoData.value;
  set updateShowNoData(bool val){
    showNoData.value=val;
    update();
  }
  set updateResultData(Map val){
    userStatistics=val['responseValue']['userStatistics'];
    // print(userStatistics.toString());
    update();
  }
}