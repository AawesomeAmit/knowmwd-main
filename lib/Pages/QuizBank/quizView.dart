import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/Pages/QuizBank/quizModal.dart';

class QuizView extends StatefulWidget {
  const QuizView({Key? key}) : super(key: key);

  @override
  _QuizViewState createState() => _QuizViewState();
}

var timeRemaining=0;
// get() async{
//   await getStringValuesSF();
//   await getQuestionsData();
//   setState(() {
//     qc.text=questionsList[index]['Question'].toString();
//     marks = questionsList[index]['Markes'].toString();
//     completeData.clear();
//   });
//   timeRemaining=10*60;
//   // timeRemaining=int.parse(widget.timeOfExam)*60;
//   _startTimer();
// }
//
// late Timer _timer;
//
// void _startTimer() {
//   _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
//     setState(() {
//       timeRemaining=timeRemaining-1;
//     });
//     print(timeRemaining);
//     if(timeRemaining==0)
//     {
//       _timer.cancel();
//       msg= 'Exam Time is Over.';
//       _showMyDialog();
//     }
//     else
//     {
//       print('shoot');
//     }
//
//   });
// }

class _QuizViewState extends State<QuizView> {
  final String ExamId='';
  final String timeOfExam='';
  final String examName='';
  QuizModal modal=QuizModal();

  var InstituteIdc;
  var StudentIdc;

  var question;
  var optionA;
  var optionB;
  var optionC;
  var optionD;
  var marks= '0';
  var totalMarks=0;
  var answer;
  int index = 0;
  int quesNum= 1;
  int savepage=0;
  int numofQues=0;
  List completeData = [];

  var qc = TextEditingController();
  var mc = TextEditingController();
  var answerc = TextEditingController();


  save() async{
    /*var target = completeData.firstWhere((item) => item["QuesID"] == questionsList[index]['QuesId'],orElse: () => null);
    if (target != null) {
      setState(() {
        target["Answer"] = answerc.text;
      });
    }
    else
    {
      setState(() {
        if(answerc.text=='')
        {
          completeData.add({
            'QuesID': questionsList[index]['QuesId'],
            'Answer': 'Skiped Answer'
          });
        }
        completeData.add({
          'QuesID': questionsList[index]['QuesId'],
          'Answer': answerc.text
        });
      });
    }
    print(StudentIdc);
    print(jsonEncode(completeData));
    final response = await http.post(
        baseUrl+'SaveAnswer',
        body: {
          'dtQues': jsonEncode(completeData),
          'QuesType': '2',
          'StudentId': StudentIdc.toString(),
          'ExamID' : widget.ExamId.toString()
        }
    );
    final data = json.decode(response.body);
    print(data);
    Navigator.of(context).pop();
    Navigator.of(context).pop();*/
  }

  saveAfterTimer() async{
    /*print(questionsList);
    for(int i=completeData.length; i<questionsList.length; i++)
    {
      completeData.add({
        'QuesID': questionsList[i]['QuesId'], 'Answer': answerc.text
      });
      if(answerc.text!='')
      {
        answerc.clear();
      }
    }
    // print(StudentIdc);
    print(jsonEncode(completeData));
    final response = await http.post(
        baseUrl+'SaveAnswer',
        body: completeData.isEmpty? {
          'QuesType': '2',
          'StudentId': StudentIdc.toString(),
          'ExamID' : widget.ExamId.toString()
        }:{
          'dtQues': jsonEncode(completeData),
          'QuesType': '2',
          'StudentId': StudentIdc.toString(),
          'ExamID' : widget.ExamId.toString()
        }
    );
    final data = json.decode(response.body);
    print(data);
    Navigator.of(context).pop();
    Navigator.of(context).pop();*/
  }
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        timeRemaining=timeRemaining-1;
      });
      print(timeRemaining);
      if(timeRemaining==0)
      {
        _timer.cancel();
        msg= 'Exam Time is Over.';
        _showMyDialog();
      }
      else
      {
        print('shoot');
      }

    });
  }

  var msg;
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: (){
            save();
            return Future.value(false);
          },
          child: AlertDialog(
            title: const Text('Alert !!!'),
            content: Text(msg),
            actions: <Widget>[
              Row(
                children: [
                  Visibility(
                    visible: timeRemaining!=0,
                    child: Container(
                      width: 100,
                      height: 30,
                      color: Colors.grey[500],
                      child: FlatButton(
                        child: Text('Cancel',
                          style: TextStyle(
                              color: Colors.white
                          ),),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 100,
                    height: 30,
                    color: Colors.green,
                    child: FlatButton(
                      child: Text('Save',
                        style: TextStyle(
                            color: Colors.white
                        ),),
                      onPressed: () async{
                        if(timeRemaining==0)
                        {
                          saveAfterTimer();
                        }
                        else{
                          save();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // String questionsUrl = baseUrl+'ShowQuestion';
  List questionsList = [];
  var questionsID;
  getQuestionsData() async {
    print('exaamidddddd');
    // print(widget.ExamId);
    var response;
    /*await http.post(
        questionsUrl,
        body: {
          'QuesType': '0',
          'ExamID': widget.ExamId.toString(),
          'InstituteId': InstituteIdc.toString(),
        }
    );*/
    response= {
      "responseCode": 1,
      "body": "Success",
      "responseValue": [{"QuesId":61,"Question":"ABG PROCEDURE","imagePath":"http://182.156.200.179:105/fileUpload/ABG PROCEDURE.png","noOfQs":"131", "Markes":1},{"QuesId":60,"Question":"ACUTE AND CHRONIC LARYNGITIS","imagePath":"http://182.156.200.179:105/fileUpload/ACUTE AND CHRONIC LARYNGITIS.png","noOfQs":"162", "Markes":1},{"QuesId":680,"Question":"ANAESTHESIA","imagePath":"http://182.156.200.179:105/fileUpload/ANAESTHESIA.png","noOfQs":"2", "Markes":1},{"QuesId":637,"Question":"ANAESTHESIA MCQ","imagePath":"","noOfQs":"14", "Markes":1}]
    };
    print(response);
    var data = json.decode(response.body);
    print('vbvrbbvfjhbjfbjfbjfbfbjfbj');
    print(data);
    totalMarks=0;
    setState(() {
      for(int i=0; i<data['responseValue'].length;i++)
      {
        totalMarks=totalMarks+data['responseValue'][0][i]['Markes'] as int;
        print('total number');
        print(totalMarks);
      }
      questionsList = data['responseValue'][0];
      print('najafsub');
      print(questionsList);
      numofQues = questionsList.length;
      savepage= numofQues-1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColorDark,
      child: SafeArea(
        child: Scaffold(
          /*appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('ExamName',
              style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 15
              ),),
            leading: IconButton(
              splashColor: Colors.indigo,
              icon: Icon(Icons.arrow_back,
                color: Colors.lightBlue,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('TM- ' +totalMarks.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                ],
              ),
            ],
          ),*/
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                /*Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Time Left:- ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      Text((timeRemaining/3600%60).toInt().toString().padLeft(2, '0')+':'
                          +(timeRemaining/60%60).toInt().toString().padLeft(2, '0')+':'
                          +(timeRemaining%60).toInt().toString().padLeft(2, '0')+' ',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15
                        ),),
                      Text('Hr',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                    ],
                  ),
                ),*/
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Radio(
//                      value: 1,
//                      groupValue: selectRadio,
//                      activeColor: Colors.blue,
//                      onChanged: (val){
//                        setState(() {
//                          selectRadio = val;
//                          visibility = true;
//                          qc.clear();
//                          mc.clear();
//                          ac.clear();
//                          bc.clear();
//                          cc.clear();
//                          dc.clear();
//                        });
//                      },
//                    ),
//                    Text('Objective'),
//                    Radio(
//                      value: 2,
//                      groupValue: selectRadio,
//                      activeColor: Colors.blue,
//                      onChanged: (val){
//                        setState(() {
//                          selectRadio = val;
//                          visibility = false;
//                          qc.clear();
//                          mc.clear();
//                          ac.clear();
//                          bc.clear();
//                          cc.clear();
//                          dc.clear();
//                        });
//                      },
//                    ),
//                    Text('Subjective'),
//                  ],
//                ),
                SizedBox(
                    height: 20.0
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20),
                    Text('Question No. '+ '$quesNum',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        decoration: new BoxDecoration(
                            color: AppColor.greyLighter,
                            borderRadius: new BorderRadius.all(Radius.circular(10.0),)
                        ),
                        child:
                        Text('Good Morning!',
                          textAlign: TextAlign.start,
                          style: MyTextTheme().mediumBCB,),
                      ),
                    ),
                    SizedBox(width: 20,),
                  ],
                ),
                SizedBox(
                    height: 15.0
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20),
                    Text('Answer',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        decoration: new BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: new BorderRadius.all(Radius.circular(10.0),)
                        ),
                        child: new TextField(
                          controller: answerc,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.all(5),
                            //fillColor: Colors.green
                          ),
                          keyboardType: TextInputType.emailAddress ,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                          maxLines: 1000,
                          minLines: 16,
                          onChanged: (String n){
                            setState(() {
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 5,
                        child: SizedBox()),
                    Expanded(
                      flex: 20,
                      child: Container(
                        margin: EdgeInsets.all(0),
                        child: FlatButton(
                            child: FittedBox(
                              child: Icon(Icons.arrow_back_ios),
                            ),
                            color: Color.fromRGBO(255, 86, 115, 1.0),
                            textColor: Colors.white,
                            onPressed: () async {

                              if(index>0);

                            }
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: SizedBox()),
                    Expanded(
                      flex: 20,
                      child: Container(
                        child: index==savepage? Container(): answerc.text==''? FlatButton(
                            child: FittedBox(
                              child: Text('Skip'),
                            ),
                            color: Colors.grey[400],
                            textColor: Colors.white,
                            onPressed: () {
                              print(answerc.text);
                              if(answerc.text=='');

                            }
                        ): Container(),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: SizedBox()),
                    Expanded(
                      flex: 20,
                      child: Container(
                        margin: EdgeInsets.all(0),
                        child: index==savepage? FlatButton(
                            child: FittedBox(
                              child: Text('Save'),
                            ),
                            color: Colors.green,
                            textColor: Colors.white,
                            onPressed: () async {
                              msg='Are you Sure to Save your Answer Sheet';
                              _showMyDialog();
                            }
                        ):FlatButton(
                            child: FittedBox(
                              child: Icon(Icons.arrow_forward_ios),
                            ),
                            color: Color.fromRGBO(255, 86, 115, 1.0),
                            textColor: Colors.white,
                            onPressed: () {
                              print(answerc.text);
                              if(answerc.text!='')
                              {
                                if(index<numofQues)
                                {
                                  var target = completeData.firstWhere((item) => item["QuesID"] == questionsList[index]['QuesId'],orElse: () => null);
                                  if (target != null) {
                                    setState(() {
                                      target["Answer"] = answerc.text;
                                    });
                                  }
                                  else
                                  {
                                    setState(() {
                                      completeData.add({
                                        'QuesID': questionsList[index]['QuesId'],
                                        'Answer': answerc.text
                                      });
                                    });
                                  }
                                  print(completeData);
//                                  completeData.clear();
                                  print(completeData[index]['Answer']);
                                  setState(() {
                                    quesNum = quesNum + 1;
                                    index = index + 1;
                                    qc.text = questionsList[index]['Question']
                                        .toString();
                                    marks =
                                        questionsList[index]['Markes'].toString();
                                    answerc.clear();
                                  });
                                  if(completeData[index]['Answer'].toString() != '')
                                  {
                                    setState(() {
                                      answerc.text =
                                      completeData[index]['Answer'];
                                    });
                                  }
                                }
                                print(index);
                              }
                              else{
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Alert !!!'),
                                      content: Text('Plz write Your Answer First'),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('Okay',
                                            style: TextStyle(
                                                color: Colors.lightBlue
                                            ),),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: SizedBox()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
