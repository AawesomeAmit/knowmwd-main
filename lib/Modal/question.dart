// To parse this JSON data, do
//
//     final question = questionFromJson(jsonString);

import 'dart:convert';

Question questionFromJson(String str) => Question.fromJson(json.decode(str));

String questionToJson(Question data) => json.encode(data.toJson());

class Question {
  Question({
    this.responseCode,
    this.responseMessage,
    this.responseValue,
  });

  int? responseCode;
  String? responseMessage;
  ResponseValue? responseValue;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    responseCode: json["responseCode"],
    responseMessage: json["responseMessage"],
    responseValue: ResponseValue.fromJson(json["responseValue"]),
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode,
    "responseMessage": responseMessage,
    "responseValue": responseValue?.toJson(),
  };
}

class ResponseValue {
  ResponseValue({
    this.optionList,
    this.symbolList,
    this.examDashboardList,
  });

  List<OptionList>? optionList;
  List<SymbolList>? symbolList;
  List<ExamDashboardList>? examDashboardList;

  factory ResponseValue.fromJson(Map<String, dynamic> json) => ResponseValue(
    optionList: List<OptionList>.from(json["optionList"].map((x) => OptionList.fromJson(x))),
    symbolList: List<SymbolList>.from(json["symbolList"].map((x) => SymbolList.fromJson(x))),
    examDashboardList: List<ExamDashboardList>.from(json["examDashboardList"].map((x) => ExamDashboardList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "optionList": List<dynamic>.from(optionList!.map((x) => x.toJson())),
    "symbolList": List<dynamic>.from(symbolList!.map((x) => x.toJson())),
    "examDashboardList": List<dynamic>.from(examDashboardList!.map((x) => x.toJson())),
  };
}

class ExamDashboardList {
  ExamDashboardList({
    this.sNo,
    this.colorCode,
    this.isAttempted,
    this.selectedOptionId,
    this.isCorrect,
    this.correctOptionId,
    this.totalQuestion,
    this.totalAttemptedQuestion,
    this.lastVisitedQuestionId,
    this.lastVisitedSNo,
  });

  int? sNo;
  ColorCode? colorCode;
  int? isAttempted;
  int? selectedOptionId;
  bool? isCorrect;
  int? correctOptionId;
  int? totalQuestion;
  int? totalAttemptedQuestion;
  int? lastVisitedQuestionId;
  int? lastVisitedSNo;

  factory ExamDashboardList.fromJson(Map<String, dynamic> json) => ExamDashboardList(
    sNo: json["sNo"],
    colorCode: colorCodeValues.map![json["colorCode"]],
    isAttempted: json["isAttempted"],
    selectedOptionId: json["selectedOptionId"],
    isCorrect: json["isCorrect"],
    correctOptionId: json["correctOptionId"],
    totalQuestion: json["totalQuestion"],
    totalAttemptedQuestion: json["totalAttemptedQuestion"],
    lastVisitedQuestionId: json["lastVisitedQuestionId"],
    lastVisitedSNo: json["lastVisitedSNo"],
  );

  Map<String, dynamic> toJson() => {
    "sNo": sNo,
    "colorCode": colorCodeValues.reverse![colorCode],
    "isAttempted": isAttempted,
    "selectedOptionId": selectedOptionId,
    "isCorrect": isCorrect,
    "correctOptionId": correctOptionId,
    "totalQuestion": totalQuestion,
    "totalAttemptedQuestion": totalAttemptedQuestion,
    "lastVisitedQuestionId": lastVisitedQuestionId,
    "lastVisitedSNo": lastVisitedSNo,
  };
}

enum ColorCode { THE_9_E0_B0_F, THE_3_BB54_A, B7_B7_B7_A8 }

final colorCodeValues = EnumValues({
  "#b7b7b7a8": ColorCode.B7_B7_B7_A8,
  "#3BB54A": ColorCode.THE_3_BB54_A,
  "#9E0B0F": ColorCode.THE_9_E0_B0_F
});

class OptionList {
  OptionList({
    this.sNo,
    this.id,
    this.question,
    this.remainingTime,
    this.optionDetails,
  });

  int? sNo;
  int? id;
  String? question;
  int? remainingTime;
  String? optionDetails;

  factory OptionList.fromJson(Map<String, dynamic> json) => OptionList(
    sNo: json["sNo"],
    id: json["id"],
    question: json["question"],
    remainingTime: json["remainingTime"],
    optionDetails: json["optionDetails"],
  );

  Map<String, dynamic> toJson() => {
    "sNo": sNo,
    "id": id,
    "question": question,
    "remainingTime": remainingTime,
    "optionDetails": optionDetails,
  };
}

class SymbolList {
  SymbolList({
    this.id,
    this.symbolName,
    this.colorCode,
  });

  int? id;
  String? symbolName;
  ColorCode? colorCode;

  factory SymbolList.fromJson(Map<String, dynamic> json) => SymbolList(
    id: json["id"],
    symbolName: json["symbolName"],
    colorCode: colorCodeValues.map![json["colorCode"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "symbolName": symbolName,
    "colorCode": colorCodeValues.reverse![colorCode],
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}