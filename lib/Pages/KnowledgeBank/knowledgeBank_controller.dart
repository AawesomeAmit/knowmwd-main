
import 'package:get/get.dart';
import 'package:knowmed_flutter/Modal/questionListKnowledgeBank.dart';
import 'package:knowmed_flutter/Modal/questionListKnowledgeBank.dart';
import 'package:knowmed_flutter/Modal/questionListKnowledgeBank.dart';
import 'package:knowmed_flutter/Modal/topicListKnowledgeBank.dart';
import 'package:knowmed_flutter/Modal/subjectListKnowledgeBank.dart';

class KnowledgeBankController extends GetxController{

  RxBool showNoData=false.obs;
  bool get getShowNoData=>showNoData.value;
  set updateShowNoData(bool val){
    showNoData.value=val;
    update();
  }
  List questionList=[].obs;
  List subjectList=[].obs;
  List topicList=[].obs;
  List<ResponseValue3> get getSubjectList=>List<ResponseValue3>.from(
      subjectList.map((element) => ResponseValue3.fromJson(element))
  );
  List<ResponseValue2> get getTopicList=>List<ResponseValue2>.from(
      topicList.map((element) => ResponseValue2.fromJson(element))
  );
  List<ResponseValue1> get getQuestionList=>List<ResponseValue1>.from(
      questionList.map((element) => ResponseValue1.fromJson(element))
  );
  updateKnowledgeBankSubjectList(List data){
    subjectList=data;
    update();
  }
  updateKnowledgeBankTopicList(List data){
    topicList=data;
    update();
  }
  updateKnowledgeBankQuestionList(List data){
    questionList=data;
    update();
  }
}