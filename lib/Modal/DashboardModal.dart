// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  DashboardModel({
    this.responseCode,
    this.responseMessage,
    this.responseValue,
  });

  int? responseCode;
  String? responseMessage;
  List<ResponseValue>? responseValue;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    responseCode: json["responseCode"],
    responseMessage: json["responseMessage"],
    responseValue: List<ResponseValue>.from(json["responseValue"].map((x) => ResponseValue.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode,
    "responseMessage": responseMessage,
    "responseValue": List<dynamic>.from(responseValue!.map((x) => x.toJson())),
  };
}

class ResponseValue {
  ResponseValue({
    this.questionOfTheDay,
    this.suggestedMockTest,
    this.suggestedQuizBank,
    this.suggestedVideos,
  });

  List<QuestionOfTheDay>? questionOfTheDay;
  List<Suggested>? suggestedMockTest;
  List<Suggested>? suggestedQuizBank;
  List<SuggestedVideo>? suggestedVideos;

  factory ResponseValue.fromJson(Map<String, dynamic> json) => ResponseValue(
    questionOfTheDay: List<QuestionOfTheDay>.from(json["questionOfTheDay"].map((x) => QuestionOfTheDay.fromJson(x))),
    suggestedMockTest: List<Suggested>.from(json["suggestedMockTest"].map((x) => Suggested.fromJson(x))),
    suggestedQuizBank: List<Suggested>.from(json["suggestedQuizBank"].map((x) => Suggested.fromJson(x))),
    suggestedVideos: List<SuggestedVideo>.from(json["suggestedVideos"].map((x) => SuggestedVideo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "questionOfTheDay": List<dynamic>.from(questionOfTheDay!.map((x) => x.toJson())),
    "suggestedMockTest": List<dynamic>.from(suggestedMockTest!.map((x) => x.toJson())),
    "suggestedQuizBank": List<dynamic>.from(suggestedQuizBank!.map((x) => x.toJson())),
    "suggestedVideos": List<dynamic>.from(suggestedVideos!.map((x) => x.toJson())),
  };
}

class QuestionOfTheDay {
  QuestionOfTheDay({
    this.id,
    this.question,
    this.options,
    this.isAnswered,
    this.resultText,
    this.correctOptionId,
    this.selectedOptionId,
  });

  int? id;
  String? question;
  List<Option>? options;
  int? isAnswered;
  String? resultText;
  int? correctOptionId;
  dynamic selectedOptionId;

  factory QuestionOfTheDay.fromJson(Map<String, dynamic> json) => QuestionOfTheDay(
    id: json["id"],
    question: json["question"],
    options: List<Option>.from(jsonDecode(json["options"]).map((x) => Option.fromJson(x))),
    isAnswered: json["isAnswered"],
    resultText: json["resultText"],
    correctOptionId: json["correctOptionId"],
    selectedOptionId: json["selectedOptionId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "options": List<dynamic>.from(options!.map((x) => x.toJson())),
    "isAnswered": isAnswered,
    "resultText": resultText,
    "correctOptionId": correctOptionId,
    "selectedOptionId": selectedOptionId,
  };
}

class Option {
  Option({
    this.sAlpha,
    this.id,
    this.questionId,
    this.optionName,
  });

  String? sAlpha;
  int? id;
  int? questionId;
  String? optionName;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    sAlpha: json["sAlpha"],
    id: json["id"],
    questionId: json["questionId"],
    optionName: json["optionName"],
  );

  Map<String, dynamic> toJson() => {
    "sAlpha": sAlpha,
    "id": id,
    "questionId": questionId,
    "optionName": optionName,
  };
}

class Suggested {
  Suggested({
    this.id,
    this.subjectName,
    this.topicDetails,
    this.imagePath,
    this.topicCount,
    this.attempted,
    this.completedPercentage,
    this.completedPercentageColor,
  });

  int? id;
  String? subjectName;
  List<TopicDetail>? topicDetails;
  String? imagePath;
  int? topicCount;
  int? attempted;
  int? completedPercentage;
  String? completedPercentageColor;

  factory Suggested.fromJson(Map<String, dynamic> json) => Suggested(
    id: json["id"],
    subjectName: json["subjectName"],
    topicDetails: List<TopicDetail>.from(jsonDecode(json["topicDetails"]).map((x) => TopicDetail.fromJson(x))),
    // options: List<Option>.from(jsonDecode(json["options"]).map((x) => Option.fromJson(x))),
    imagePath: json["imagePath"],
    topicCount: json["topicCount"],
    attempted: json["attempted"],
    completedPercentage: json["completedPercentage"],
    completedPercentageColor: json["completedPercentageColor"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subjectName": subjectName,
    "topicDetails": List<dynamic>.from(topicDetails!.map((x) => x.toJson())),
    "imagePath": imagePath,
    "topicCount": topicCount,
    "attempted": attempted,
    "completedPercentage": completedPercentage,
    "completedPercentageColor": completedPercentageColor,
  };
}

class TopicDetail {
  TopicDetail({
    this.id,
    this.topicName,
    this.imagePath,
    this.noOfQs,
  });

  int? id;
  String? topicName;
  String? imagePath;
  String? noOfQs;

  factory TopicDetail.fromJson(Map<String, dynamic> json) => TopicDetail(
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

class SuggestedVideo {
  SuggestedVideo({
    this.videoId,
    this.topicId,
    this.topicName,
    this.thumbNail,
    this.videoPath,
  });

  int? videoId;
  int? topicId;
  String? topicName;
  String? thumbNail;
  String? videoPath;

  factory SuggestedVideo.fromJson(Map<String, dynamic> json) => SuggestedVideo(
    videoId: json["videoId"],
    topicId: json["topicId"],
    topicName: json["topicName"],
    thumbNail: json["thumbNail"],
    videoPath: json["videoPath"],
  );

  Map<String, dynamic> toJson() => {
    "videoId": videoId,
    "topicId": topicId,
    "topicName": topicName,
    "thumbNail": thumbNail,
    "videoPath": videoPath,
  };
}
