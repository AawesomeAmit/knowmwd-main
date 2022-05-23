class QuestionListKnowledgeBank {
  int? responseCode;
  String? responseMessage;
  List<ResponseValue1>? responseValue;

  QuestionListKnowledgeBank(
      {this.responseCode, this.responseMessage, this.responseValue});

  QuestionListKnowledgeBank.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
    if (json['responseValue'] != null) {
      responseValue = <ResponseValue1>[];
      json['responseValue'].forEach((v) {
        responseValue!.add(new ResponseValue1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    if (this.responseValue != null) {
      data['responseValue'] =
          this.responseValue!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResponseValue1 {
  int? id;
  String? question;
  String? description;
  String? subjectName;
  int? isBookmarked;

  ResponseValue1(
      {this.id,
        this.question,
        this.description,
        this.subjectName,
        this.isBookmarked});

  ResponseValue1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    description = json['description'];
    subjectName = json['subjectName'];
    isBookmarked = json['isBookmarked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['description'] = this.description;
    data['subjectName'] = this.subjectName;
    data['isBookmarked'] = this.isBookmarked;
    return data;
  }
}