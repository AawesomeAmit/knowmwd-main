// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

QuizBankListModal quizBankListModal(String str) => QuizBankListModal.fromJson(json.decode(str));

String quizBankModal(QuizBankListModal data) => json.encode(data.toJson());

class QuizBankListModal {
  QuizBankListModal({
    this.responseCode,
    this.responseMessage,
    this.responseValue,
  });

  int? responseCode;
  String? responseMessage;
  ResponseValue? responseValue;

  factory QuizBankListModal.fromJson(Map<String, dynamic> json) => QuizBankListModal(
    responseCode: json["responseCode"],
    responseMessage: json["responseMessage"],
    responseValue: ResponseValue.fromJson(json["responseValue"]),
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode,
    "responseMessage": responseMessage,
    "responseValue": responseValue!.toJson(),
  };
}

class ResponseValue {
  ResponseValue({
    this.subjectList,
    this.topicList,
  });

  List<SubjectList>? subjectList;
  List<TopicList>? topicList;

  factory ResponseValue.fromJson(Map<String, dynamic> json) => ResponseValue(
    subjectList: List<SubjectList>.from(json["subjectList"].map((x) => SubjectList.fromJson(x))),
    topicList: List<TopicList>.from(json["topicList"].map((x) => TopicList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subjectList": List<dynamic>.from(subjectList!.map((x) => x.toJson())),
    "topicList": List<dynamic>.from(topicList!.map((x) => x.toJson())),
  };
}

class SubjectList {
  SubjectList({
    this.id,
    this.subjectName,
    this.imagePath,
    this.topicDetails,
    this.topicCount,
    this.attempted,
    this.completedPercentage,
    this.completedPercentageColor,
  });

  int? id;
  String? subjectName;
  String? imagePath;
  String? topicDetails;
  int? topicCount;
  int? attempted;
  int? completedPercentage;
  String? completedPercentageColor;

  factory SubjectList.fromJson(Map<String, dynamic> json) => SubjectList(
    id: json["id"],
    subjectName: json["subjectName"],
    imagePath: json["imagePath"],
    topicDetails: json["topicDetails"],
    topicCount: json["topicCount"],
    attempted: json["attempted"],
    completedPercentage: json["completedPercentage"],
    completedPercentageColor: json["completedPercentageColor"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subjectName": subjectName,
    "imagePath": imagePath,
    "topicDetails": topicDetails,
    "topicCount": topicCount,
    "attempted": attempted,
    "completedPercentage": completedPercentage,
    "completedPercentageColor": completedPercentageColor,
  };
}

class TopicList {
  TopicList({
    this.subjectId,
    this.categoryName,
    this.topicDetails,
  });

  int? subjectId;
  String? categoryName;
  String? topicDetails;

  factory TopicList.fromJson(Map<String, dynamic> json) => TopicList(
    subjectId: json["subjectId"],
    categoryName: json["categoryName"],
    topicDetails: json["topicDetails"],
  );

  Map<String, dynamic> toJson() => {
    "subjectId": subjectId,
    "categoryName": categoryName,
    "topicDetails": topicDetails,
  };
}

class TopicDetails {
  TopicDetails({
    this.id,
    this.topicName,
    this.imagePath,
    this.noOfQs,
  });

  int? id;
  String? topicName;
  String? imagePath;
  String? noOfQs;

  factory TopicDetails.fromJson(Map<String, dynamic> json) => TopicDetails(
    id: json["id"],
    topicName: json["topicName"],
    imagePath: json["imagePath"],
    noOfQs: json["noOfQs"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "topicName": topicName,
    "imagePath": imagePath,
    "noOfQs": noOfQs,
  };
}
