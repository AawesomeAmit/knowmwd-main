class TopicListKnowledgeBank {
  int? responseCode;
  String? responseMessage;
  List<ResponseValue2>? responseValue;

  TopicListKnowledgeBank(
      {this.responseCode, this.responseMessage, this.responseValue});

  TopicListKnowledgeBank.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
    if (json['responseValue'] != null) {
      responseValue = <ResponseValue2>[];
      json['responseValue'].forEach((v) {
        responseValue!.add(new ResponseValue2.fromJson(v));
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

class ResponseValue2 {
  int? id;
  int? subjectId;
  String? topicName;

  ResponseValue2({this.id, this.subjectId, this.topicName});

  ResponseValue2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectId = json['subjectId'];
    topicName = json['topicName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subjectId'] = this.subjectId;
    data['topicName'] = this.topicName;
    return data;
  }
}
