class VideoList {
  int? responseCode;
  String? responseMessage;
  List<ResponseValue>? responseValue;

  VideoList({this.responseCode, this.responseMessage, this.responseValue});

  VideoList.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
    if (json['responseValue'] != null) {
      responseValue = <ResponseValue>[];
      json['responseValue'].forEach((v) {
        responseValue!.add(new ResponseValue.fromJson(v));
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

class ResponseValue {
  int? subjectId;
  String? subjectName;
  String? subjectImagePath;

  ResponseValue({this.subjectId, this.subjectName, this.subjectImagePath});

  ResponseValue.fromJson(Map<String, dynamic> json) {
    subjectId = json['subjectId'];
    subjectName = json['subjectName'];
    subjectImagePath = json['subjectImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subjectId'] = this.subjectId;
    data['subjectName'] = this.subjectName;
    data['subjectImagePath'] = this.subjectImagePath;
    return data;
  }
}
