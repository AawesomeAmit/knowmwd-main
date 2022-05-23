import 'dart:convert';
class OptionList{
  String?question;
  int?serial_number;
  int?id;
  List<OptionDetails>?optionDetails;
  OptionList({
    this.question,
    this.id,
    this.serial_number,
    this.optionDetails,
    });
  factory OptionList.fromJson(Map<String, dynamic> json) =>
      OptionList(
        serial_number: json['sNo']??0,
        id: json['id']??0,
        question: json['question'],
        optionDetails:List<OptionDetails>.from(
            jsonDecode(json["optionDetails"]??[]).map((element) => OptionDetails.fromJson(element))
        )
          );
}
class OptionDetails{
  String?sequence;
  int?id;
  String?option;
  bool? isSelected;
  OptionDetails({
    this.id,
    this.option,
    this.sequence,
      this.isSelected,
});
  factory OptionDetails.fromJson(Map<String, dynamic> json) =>
      OptionDetails(
        sequence: json['sAlpha'],
        id: json['id'],
        option: json['optionName'],
        isSelected: json['isSelected']
      );
}

class Colors_list{
  String?symbol_name;
  int?id;
  String?color_code;
  Colors_list({
    this.id,
    this.color_code,
    this.symbol_name
});
  factory Colors_list.fromJson(Map<String,dynamic> json)=>
      Colors_list(
        symbol_name: json["symbolName"],
        id: json[ "id"],
        color_code: json["colorCode"],
      );
}

class ExamDashBoard{
  int?serial_number;
  String?color_code;
  int?isAttempted;
  int?selected_Optionid;
  bool?isCorrect;
  int?correct_OptionId;
  int?totalAttemptedQuestion;
  ExamDashBoard({
   this.color_code,
   this.serial_number,
    this.correct_OptionId,
    this.isAttempted,
    this.isCorrect,
    this.selected_Optionid,
    this.totalAttemptedQuestion
});

  factory ExamDashBoard.fromJson(Map<String,dynamic> json)=>
  ExamDashBoard(
    serial_number: json["sNo"],
    color_code: json["colorCode"],
    isAttempted: json["isAttempted"],
    selected_Optionid: json["selectedOptionId"],
    isCorrect: (json["isCorrect"] is bool)?json["isCorrect"]: json["isCorrect"]==0? false:true,
    correct_OptionId: json["correctOptionId"],
    totalAttemptedQuestion: json["totalAttemptedQuestion"]
  ) ;
}

