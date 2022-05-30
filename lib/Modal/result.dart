// To parse this JSON data, do
//
//     final result = resultFromJson(jsonString);

import 'dart:convert';

Result resultFromJson(String str) => Result.fromJson(json.decode(str));

String resultToJson(Result data) => json.encode(data.toJson());

class Result {
  Result({
    this.responseCode,
    this.responseMessage,
    this.responseValue,
  });

  int? responseCode;
  String? responseMessage;
  ResponseValue? responseValue;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
    this.userStatistics,
  });

  List<UserStatistic>? userStatistics;

  factory ResponseValue.fromJson(Map<String, dynamic> json) => ResponseValue(
    userStatistics: List<UserStatistic>.from(json["userStatistics"].map((x) => UserStatistic.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userStatistics": List<dynamic>.from(userStatistics!.map((x) => x.toJson())),
  };
}

class UserStatistic {
  UserStatistic({
    this.totalQuiz,
    this.avgQuizBank,
    this.totalMockTest,
    this.avgMockTest,
    this.totalPastExam,
    this.avgPastExam,
    this.totalVideos,
    this.avgVideo,
    this.totalMockQuestion,
    this.totalMockCorrect,
    this.totalMockIncorrect,
    this.totalQuizQuestion,
    this.totalQuizCorrect,
    this.totalQuizIncorrect,
    this.totalpastQuestion,
    this.totalPastCorrect,
    this.totalPastIncorrect,
    this.totalMockStat,
    this.totalQuizStat,
    this.totalPastStat,
    this.totalMcq,
    this.totalMcqCorrect,
    this.totalMcqInCorrect,
    this.overAll,
  });

  String? totalQuiz;
  double? avgQuizBank;
  String? totalMockTest;
  double? avgMockTest;
  String? totalPastExam;
  double? avgPastExam;
  String? totalVideos;
  double? avgVideo;
  double? totalMockQuestion;
  double? totalMockCorrect;
  double? totalMockIncorrect;
  double? totalQuizQuestion;
  double? totalQuizCorrect;
  double? totalQuizIncorrect;
  double? totalpastQuestion;
  double? totalPastCorrect;
  double? totalPastIncorrect;
  double? totalMockStat;
  double? totalQuizStat;
  double? totalPastStat;
  int? totalMcq;
  int? totalMcqCorrect;
  int? totalMcqInCorrect;
  String? overAll;

  factory UserStatistic.fromJson(Map<String, dynamic> json) => UserStatistic(
    totalQuiz: json["totalQuiz"],
    avgQuizBank: json["avgQuizBank"].toDouble(),
    totalMockTest: json["totalMockTest"],
    avgMockTest: json["avgMockTest"].toDouble(),
    totalPastExam: json["totalPastExam"],
    avgPastExam: json["avgPastExam"].toDouble(),
    totalVideos: json["totalVideos"],
    avgVideo: json["avgVideo"].toDouble(),
    totalMockQuestion: json["totalMockQuestion"],
    totalMockCorrect: json["totalMockCorrect"],
    totalMockIncorrect: json["totalMockIncorrect"],
    totalQuizQuestion: json["totalQuizQuestion"],
    totalQuizCorrect: json["totalQuizCorrect"],
    totalQuizIncorrect: json["totalQuizIncorrect"],
    totalpastQuestion: json["totalpastQuestion"],
    totalPastCorrect: json["totalPastCorrect"],
    totalPastIncorrect: json["totalPastIncorrect"],
    totalMockStat: json["totalMockStat"].toDouble(),
    totalQuizStat: json["totalQuizStat"].toDouble(),
    totalPastStat: json["totalPastStat"].toDouble(),
    totalMcq: json["totalMcq"],
    totalMcqCorrect: json["totalMcqCorrect"],
    totalMcqInCorrect: json["totalMcqInCorrect"],
    overAll: json["overAll"],
  );

  Map<String, dynamic> toJson() => {
    "totalQuiz": totalQuiz,
    "avgQuizBank": avgQuizBank,
    "totalMockTest": totalMockTest,
    "avgMockTest": avgMockTest,
    "totalPastExam": totalPastExam,
    "avgPastExam": avgPastExam,
    "totalVideos": totalVideos,
    "avgVideo": avgVideo,
    "totalMockQuestion": totalMockQuestion,
    "totalMockCorrect": totalMockCorrect,
    "totalMockIncorrect": totalMockIncorrect,
    "totalQuizQuestion": totalQuizQuestion,
    "totalQuizCorrect": totalQuizCorrect,
    "totalQuizIncorrect": totalQuizIncorrect,
    "totalpastQuestion": totalpastQuestion,
    "totalPastCorrect": totalPastCorrect,
    "totalPastIncorrect": totalPastIncorrect,
    "totalMockStat": totalMockStat,
    "totalQuizStat": totalQuizStat,
    "totalPastStat": totalPastStat,
    "totalMcq": totalMcq,
    "totalMcqCorrect": totalMcqCorrect,
    "totalMcqInCorrect": totalMcqInCorrect,
    "overAll": overAll,
  };
}
