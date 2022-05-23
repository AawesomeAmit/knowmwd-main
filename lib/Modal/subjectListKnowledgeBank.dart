class SubjectListKnowledgeBank {
  int? responseCode;
  String? responseMessage;
  List<ResponseValue3>? responseValue;

  SubjectListKnowledgeBank(
      {this.responseCode, this.responseMessage, this.responseValue});

  SubjectListKnowledgeBank.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
    if (json['responseValue'] != null) {
      responseValue = <ResponseValue3>[];
      json['responseValue'].forEach((v) {
        responseValue!.add(new ResponseValue3.fromJson(v));
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

class ResponseValue3 {
  int? id;
  String? subjectName;

  ResponseValue3({this.id, this.subjectName});

  ResponseValue3.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectName = json['subjectName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subjectName'] = this.subjectName;
    return data;
  }
}