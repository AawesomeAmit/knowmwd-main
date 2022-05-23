import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:knowmed_flutter/Modal/videoList.dart';

class VideoListController extends GetxController{

  RxBool showNoData=false.obs;
  bool get getShowNoData=>showNoData.value;
  set updateShowNoData(bool val){
    showNoData.value=val;
    update();
    }

  List videoList=[].obs;
  List<ResponseValue> get getVideoList=>List<ResponseValue>.from(
      videoList.map((element) => ResponseValue.fromJson(element))
  );

  updateVideoList(Map data){
    videoList=data['responseValue'];
    log(videoList.toString());
    videoList.isEmpty?updateShowNoData=true:updateShowNoData=false;
    // topicDetailList=data['topicList']['topicDetails'];
    update();
  }
}