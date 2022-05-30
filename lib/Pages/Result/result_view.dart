import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_app_bar.dart';
import 'package:knowmed_flutter/Pages/Result/result_controller.dart';
import 'package:knowmed_flutter/Pages/Result/result_modal.dart';
import 'package:knowmed_flutter/Services/hex_color.dart';
import '../../AppManager/app_color.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultView extends StatefulWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  ResultModal modal = ResultModal();

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
    Get.delete<ResultController>();
  }

  @override
  Widget build(BuildContext context) {
    modal.getResultData(context);
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: MyWidget().myAppBar(context,
            title: 'Statistics',
            bgColor: AppColor.primaryColorDark,
            // subtitle: modal.dashC.selectedDepartment.value.subDepartmentName,
          ),
          body: GetBuilder(
            init: ResultController(),
            builder: (_) {
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.10,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      color: Colors.blue.shade900,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 80, 0, 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              /*CircularProgressIndicator(
                              value: 50,
                              semanticsLabel: 'Linear progress indicator',
                              strokeWidth: 10,
                              backgroundColor: AppColor.red,
                            ),*/CircularPercentIndicator(
                                radius: 110.0,
                                lineWidth: 13.0,
                                animation: true,
                                percent: /*double.parse(modal.controller.getUserStatistics[0].avgQuizBank.toString())*/0.7,
                                center: Text(
                                  modal.controller.getUserStatistics
                                      .avgQuizBank.toString() + "%",
                                  // "35%",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                footer: Text(
                                  "Quiz Bank",
                                  style:
                                  new TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: "#FF9E00".toColor(),
                              ),
                              CircularPercentIndicator(
                                radius: 110.0,
                                lineWidth: 13.0,
                                animation: true,
                                percent: 60 / 100,
                                center: Text(
                                  modal.controller.getUserStatistics.avgMockTest.toString()+"%",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                footer: Text(
                                  "Mock Test",
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: "#00B9AC".toColor(),
                              ),
                              CircularPercentIndicator(
                                radius: 110.0,
                                lineWidth: 13.0,
                                animation: true,
                                percent: 0.7,
                                center: Text(
                                  modal.controller.getUserStatistics.avgVideo.toString()+"%",
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                footer: Text(
                                  "Video Watched",
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: "#58D9F1".toColor(),
                              ),
                              /*const CircularProgressIndicator(
                              value: 50,
                              semanticsLabel: 'Linear progress indicator',
                            ),*/
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10, 20, 0, 10),
                                  child:
                                  Text('Past Exam',
                                    style: MyTextTheme().mediumBCB,)
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets
                                .all(5),
                            padding: const EdgeInsets
                                .symmetric(
                                horizontal: 2,
                                vertical: 2),
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border
                                    .all(
                                    color: AppColor
                                        .greyLight,
                                    width: 1),
                                borderRadius: BorderRadius
                                    .circular(
                                    20)
                            ),
                            child: Row(
                              children: [
                                AnimatedContainer(
                                  height: 5,
                                  alignment: Alignment.centerLeft,
                                  width: double.parse(modal.controller.getUserStatistics.avgPastExam.toString()) * 3,
                                  color: '#FFC114'.toColor(),
                                  duration: Duration(seconds: 2),
                                  curve: Curves.linear,),
                              ],
                            ),
                          ),
                          Text(modal.controller.getUserStatistics.totalPastExam.toString()+' Completed',
                            style: MyTextTheme().smallGCN,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10, 10, 0, 0),
                                child:
                                Text('MCQ Attempt',
                                  style: MyTextTheme().mediumBCB,),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0, 0, 0, 5),
                                child: DataTable(
                                  columns: [
                                    DataColumn(label: Text(
                                      'Total',
                                      style: MyTextTheme().smallBCB,
                                    )),
                                    DataColumn(label: Text(
                                      'Correct',
                                      style: MyTextTheme().smallBCB,
                                    )),
                                    DataColumn(label: Text(
                                      'Incorrect',
                                      style: MyTextTheme().smallBCB,
                                    )),
                                  ],
                                  rows: [
                                    DataRow(cells: [
                                      DataCell(Text(modal.controller.getUserStatistics.totalMcq.toString())),
                                      DataCell(Text(modal.controller.getUserStatistics.totalMcqCorrect.toString())),
                                      DataCell(Text(modal.controller.getUserStatistics.totalMcqInCorrect.toString())),
                                    ]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10, 5, 0, 0),
                                child:
                                Text('Overall Test Percentage',
                                  style: MyTextTheme().mediumBCB,),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0, 0, 0, 0),
                                child: DataTable(
                                  columns: [
                                    DataColumn(label: Text(
                                      'Quiz Bank',
                                      style: MyTextTheme().smallBCB,
                                    )),
                                    DataColumn(label: Text(
                                      'Mock Test',
                                      style: MyTextTheme().smallBCB,
                                    )),
                                    DataColumn(label: Text(
                                      'Previous Exam',
                                      style: MyTextTheme().smallBCB,
                                    )),
                                  ],
                                  rows: [
                                    DataRow(cells: [
                                      DataCell(Text(modal.controller.getUserStatistics.totalQuizStat.toString())),
                                      DataCell(Text(modal.controller.getUserStatistics.totalMockStat.toString())),
                                      DataCell(Text(modal.controller.getUserStatistics.totalPastStat.toString())),
                                    ]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10, 5, 0, 0),
                                child:
                                Text('Overall Test Rating',
                                  style: MyTextTheme().mediumBCB,),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10, 5, 0, 0),
                                child:
                                Text(modal.controller.getUserStatistics.overAll.toString(),
                                  style: MyTextTheme().mediumGrCB,),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),

      ),
    );
  }
}