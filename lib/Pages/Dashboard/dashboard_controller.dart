import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Modal/DashboardModal.dart';

class DashboardController extends GetxController{

  // List menuAssigned=[].obs;

  RxBool showNoData=false.obs;
  bool get getShowNoData=>showNoData.value;
  set updateShowNoData(bool val){
    showNoData.value=val;
    update();
  }
  Rx<TextEditingController> searchC=TextEditingController().obs;

  Rx<ScrollController> scrollController=ScrollController().obs;

  final formKey = GlobalKey<FormState>().obs;

  List questionOfTheDay=[].obs;
  // QuestionOfTheDay get getquestionOfTheDay=>QuestionOfTheDay.fromJson(questionOfTheDay.isEmpty? {}:questionOfTheDay[0]);
  List<QuestionOfTheDay> get getquestionOfTheDay=>List<QuestionOfTheDay>.from(
      questionOfTheDay.map((element) => QuestionOfTheDay.fromJson(element))
  );
  List suggestedMockTest=[].obs;
  List<Suggested> get getSuggestedMockTestList=>List<Suggested>.from(
      suggestedMockTest.map((element) => Suggested.fromJson(element))
  );
  List suggestedMockTestTopics=[].obs;
  List<TopicDetail> get getSuggestedMockTestTopicList=>List<TopicDetail>.from(
      suggestedMockTestTopics.map((element) => TopicDetail.fromJson(element))
  );
  List suggestedQuizBank=[].obs;
  List<Suggested> get getSuggestedQuizBankList=>List<Suggested>.from(
      suggestedQuizBank.map((element) => Suggested.fromJson(element))
  );
  List suggestedVideos=[].obs;
  List<SuggestedVideo> get getSuggestedVideoList=>List<SuggestedVideo>.from(
      suggestedVideos.map((element) => SuggestedVideo.fromJson(element))
  );
  List responseValue=[].obs;
  List<ResponseValue> get getResponseValue=>List<ResponseValue>.from(
      responseValue.map((element) => ResponseValue.fromJson(element))
  );
  /*set updateMenuAssigned(List val){
    menuAssigned=val;

    log('My One '+menuAssigned.toString());
    update();
  }*/
  updateDashboardList(Map data){
    responseValue=data['responseValue'];
    // questionOfTheDay=List<ResponseValue>.from(responseValue[0]['questionOfTheDay']);
    questionOfTheDay=responseValue[0]['questionOfTheDay'];
    suggestedMockTest=responseValue[0]['suggestedMockTest'];
    suggestedQuizBank=responseValue[0]['suggestedQuizBank'];
    suggestedVideos=responseValue[0]['suggestedVideos'];
    // log(questionOfTheDay.toString());
    // log(suggestedMockTest.toString());
    // log(suggestedQuizBank.toString());
    log(responseValue.toString());
    // log('kjkl');
    update();
  }
}