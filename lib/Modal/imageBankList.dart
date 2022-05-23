// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ImageBankList welcomeFromJson(String str) => ImageBankList.fromJson(json.decode(str));

String welcomeToJson(ImageBankList data) => json.encode(data.toJson());

class ImageBankList {
  ImageBankList({
    this.responseCode,
    this.responseMessage,
    this.imageList,
  });

  int? responseCode;
  String? responseMessage;
  List<ImageList>? imageList;

  factory ImageBankList.fromJson(Map<String, dynamic> json) => ImageBankList(
    responseCode: json["responseCode"],
    responseMessage: json["responseMessage"],
    imageList: List<ImageList>.from(json["responseValue"].map((x) => ImageList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode,
    "responseMessage": responseMessage,
    "responseValue": List<dynamic>.from(imageList!.map((x) => x.toJson())),
  };
}

class ImageList {
  ImageList({
    this.id,
    this.question,
    this.description,
    this.subjectName,
    this.isBookmarked,
    this.questionTypeId,
    this.questionImagePath,
    this.optionList,
  });

  int? id;
  String? question;
  String? description;
  String? subjectName;
  int? isBookmarked;
  int? questionTypeId;
  String? questionImagePath;
  String? optionList;

  factory ImageList.fromJson(Map<String, dynamic> json) => ImageList(
    id: json["id"],
    question: json["question"],
    description: json["description"],
    subjectName: json["subjectName"],
    isBookmarked: json["isBookmarked"],
    questionTypeId: json["questionTypeId"],
    questionImagePath: json["questionImagePath"],
    optionList: json["optionList"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "description": description,
    "subjectName": subjectName,
    "isBookmarked": isBookmarked,
    "questionTypeId": questionTypeId,
    "questionImagePath": questionImagePath,
    "optionList": optionList,
  };
}
