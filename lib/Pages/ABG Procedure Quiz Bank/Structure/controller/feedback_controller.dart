import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../data_model/knowmed_feedback.dart';
class FeedbackController extends GetxController{

  String cache = '';

  List feedback_data = <FeedbackDataModel>[
    FeedbackDataModel(feedbackName: "Too much content",),
    FeedbackDataModel(feedbackName: "Too little content",),
    FeedbackDataModel(feedbackName: "Too Hard",),
    FeedbackDataModel(feedbackName: "Too Easy",),
    FeedbackDataModel(feedbackName: "Too NEET Pattern",),
    FeedbackDataModel(feedbackName: "Need more images",),
    FeedbackDataModel(feedbackName: "Explanation is not clear",),
    FeedbackDataModel(feedbackName: "Lacks concept",),
    FeedbackDataModel(feedbackName: "Poorly Organised",),
    FeedbackDataModel(feedbackName: "Other",),
  ];
}