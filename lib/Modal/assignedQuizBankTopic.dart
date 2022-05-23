



import 'package:flutter/material.dart';
import 'package:knowmed_flutter/AppManager/app_util.dart';
import 'package:knowmed_flutter/Services/hex_color.dart';

class AssignedQuizBankTopic {
  int id;
  String topicName;
  String noOfQs;
  String imagePath;

  AssignedQuizBankTopic(
      {
        required this.id,
        required this.topicName,
        required this.noOfQs,
        required this.imagePath,
      });

  factory AssignedQuizBankTopic.fromJson(Map<String, dynamic> json) => AssignedQuizBankTopic(
    id: json['id'],
    topicName: json['topicName'].toString(),
    noOfQs: json['noOfQs'].toString(),
    imagePath: json['imagePath'].toString(),
  );
}