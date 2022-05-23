import 'package:flutter/material.dart';
class KnowMedResult{
  double?totalCorrectPercentage;
  double?totalIncorrectPercentage;
  double?totalNotAnsweredPercentage;
  KnowMedResult({
    this.totalCorrectPercentage,
    this.totalIncorrectPercentage,
    this.totalNotAnsweredPercentage
});

  factory KnowMedResult.fromJson(Map<String,dynamic> json)=>
      KnowMedResult(
          totalCorrectPercentage: json['totalCorrectPer'],
        totalIncorrectPercentage: json['totalInCorrectPer'],
        totalNotAnsweredPercentage: json['totalNotAnsweredPer'],
      ) ;

}