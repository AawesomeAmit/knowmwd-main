
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_app_bar.dart';
import 'package:knowmed_flutter/Modal/questionListKnowledgeBank.dart';
import 'package:knowmed_flutter/Modal/subjectListKnowledgeBank.dart';
import 'package:knowmed_flutter/Pages/Dashboard/dashboard_modal.dart';
import 'package:knowmed_flutter/Pages/KnowledgeBank/knowledgeBank_controller.dart';
import 'package:knowmed_flutter/Pages/KnowledgeBank/knowledgeBank_modal.dart';
import 'package:knowmed_flutter/Services/tab_responsive.dart';

import '../common_widgets.dart';

class KnowledgeBankView extends StatefulWidget {
  const KnowledgeBankView({Key? key}) : super(key: key);

  @override
  _KnowledgeBankViewState createState() => _KnowledgeBankViewState();
}

class _KnowledgeBankViewState extends State<KnowledgeBankView> {
  KnowledgeBankModal modal=KnowledgeBankModal();
  String? _chosenValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    modal.getQuestionList(context, 0, 0);
    modal.getSubjectList(context);
    return Container(
      color: Colors.lightBlue,
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
          appBar: MyWidget().myAppBar(context,
            title: 'Pearl',
            bgColor: AppColor.primaryColorDark,
            // subtitle: modal.dashC.selectedDepartment.value.subDepartmentName,
          ),
          body: GetBuilder(
              init: KnowledgeBankController(),
              builder: (_) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Topic wise search\nGet details about selected topic',
                        style: MyTextTheme().largeBCN,),
                    ),
                  ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: DropdownButtonHideUnderline(
                          child: Container(
                            margin: EdgeInsets.all(16),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.greyLight, width: 1),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child:DropdownButton<String>(
                          focusColor:Colors.white,
                          value: _chosenValue,
                          isExpanded: true,
                          elevation: 5,
                          style: const TextStyle(color: Colors.white),
                          iconEnabledColor:Colors.black,
                          items: modal.controller.getSubjectList.map((ResponseValue3 sub){
                            return DropdownMenuItem<String>(
                              value: sub.id.toString(),
                              child: Text(sub.subjectName.toString(),
                                style: MyTextTheme().smallBCN,),
                            );
                          }).toList(),
                          /*items: <String>[
                            'Android',
                            'IOS',
                            'Flutter',
                            'Node',
                            'Java',
                            'Python',
                            'PHP',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style:TextStyle(color:Colors.black),),
                            );
                          }).toList(),*/
                          hint:Text("Select Subject",
                            style: MyTextTheme().mediumBCB,),
                          onChanged: (value) {
                            setState(() {
                              _chosenValue = value;
                              // value! as ResponseValue3?;
                            });
                          },
                        ),
                          ),
                        ),
                        ),
                        Expanded(child:
                        DropdownButtonHideUnderline(
                          child: Container(
                            margin: EdgeInsets.all(16),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.greyLight, width: 1),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child:DropdownButton<String>(
                              focusColor:Colors.white,
                              value: _chosenValue,
                              isExpanded: true,
                              elevation: 5,
                              style: TextStyle(color: Colors.white),
                              iconEnabledColor:Colors.black,
                              items: <String>[
                                // 'Android',
                                // 'IOS',
                                // 'Flutter',
                                // 'Node',
                                // 'Java',
                                // 'Python',
                                // 'PHP',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,style:TextStyle(color:Colors.black),),
                                );
                              }).toList(),
                              hint:Text("Select Topic",
                                style: MyTextTheme().mediumBCB,),
                              onChanged: (String? value) {
                                setState(() {
                                  _chosenValue = value!;
                                });
                              },
                            ),
                          ),
                        ),
                        ),
                      ],
                    ),
                    CommonWidgets().showNoData(
                        color: AppColor.white,
                        title: 'Data Not Found',
                        show: modal.controller.getShowNoData,
                        child:   Expanded(
                          child: StaggeredGridView.countBuilder(
                            crossAxisCount: 4,
                            itemCount: modal.controller.questionList.isEmpty?
                            5 :
                            modal.controller.getQuestionList.length,
                            // modal.controller.getQuestionList.length,
                            itemBuilder: (context,index){
                              ResponseValue1 questionList=modal.controller.getQuestionList.isEmpty?
                              ResponseValue1(
                                  id: 0,
                                  question: '',
                                  description: '',
                                  subjectName: '',
                                  isBookmarked: 0
                              ):
                              modal.controller.getQuestionList[index];
                              // TopicList topicList=modal.controller.getTopicList.isEmpty?
                              /*TopicList(
                                  topicDetails: '',
                                  categoryName: '',
                                  subjectId: 0
                              ):*/
                              // modal.controller.getTopicList[index];
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(10,5,10,5),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(12,12,12,5),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(width: 8,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Wrap(
                                                    crossAxisAlignment: WrapCrossAlignment.start,
                                                    children: [
                                                      Card(
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(5.0),
                                                          // child: Text(questionList.question.toString(),
                                                          //   style: MyTextTheme().mediumBCN,),
                                                          child: TextButton(
                                                            style: TextButton.styleFrom(
                                                                primary: Colors.black,
                                                                padding: const EdgeInsets.fromLTRB(8,8,8,8),
                                                                minimumSize: const Size(0,0),
                                                                tapTargetSize: MaterialTapTargetSize.shrinkWrap
                                                            ),
                                                            onPressed: () {
                                                              // modal.onPressSubject(context, subjectList.id!.toInt());
                                                              modal.onPressQuestion(context, questionList);
                                                            }, child: Text(questionList.question.toString()),),
                                                        ),
                                                      ),
                                                      /*Column(
                                                        // crossAxisAlignment: WrapCrossAlignment.center,
                                                          children: [
                                                            TextButton(
                                                              style: TextButton.styleFrom(
                                                                  primary: Colors.black,
                                                                  padding: const EdgeInsets.fromLTRB(8,8,8,8),
                                                                  minimumSize: const Size(0,0),
                                                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap
                                                              ),
                                                              onPressed: () {
                                                                // modal.onPressSubject(context, subjectList.id!.toInt());
                                                              },
                                                              child: Text(subjectList.subjectName.toString()),),
                                                            const SizedBox(height: 2,),
                                                            Text('Subject3',
                                                              style: MyTextTheme().smallGCN,),
                                                          ]
                                                      )*/
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          //   Expanded(child: SizedBox()),
                                          //   Text('marks-'+ marks,
                                          //     style: TextStyle(
                                          //       color: Colors.black,
                                          //       fontSize: 15,
                                          //     ),),
                                          //   SizedBox(width: 20),
                                          // ],

                                          Column(
                                            children: [
                                              questionList.isBookmarked==1? SvgPicture.asset('assets/bookmark1.svg'):
                                              SvgPicture.asset('assets/bookmark2.svg'),
                                            ],
                                          )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // ),
                                ),
                              );
                            },

                            staggeredTileBuilder: (int index) =>
                                StaggeredTile.fit(
                                    TabResponsive().isTab(context)? 2:4
                                ),
                            mainAxisSpacing: 0.0,
                            crossAxisSpacing: 0.0,),
                        ))

                  ],
                );
              }
          ),
        ),
      ),
    );
  }
}