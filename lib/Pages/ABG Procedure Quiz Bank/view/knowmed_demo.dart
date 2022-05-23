import 'dart:convert';

import 'package:knowmed_flutter/Services/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../AppManager/progress_dialogue.dart';
import '../../common_widgets.dart';
import '../Structure/controller/knowmed_controller.dart';
import '../Structure/data_model/knowmed_data_model.dart';
import '../Structure/model/knowmed_model.dart';
import 'package:knowmed_flutter/Pages/ABG Procedure Quiz Bank/view/Feedback_knowmed.dart';


class knowMedDemo extends StatefulWidget {
  final String sId;
  final String tId;
  const knowMedDemo(this.sId, this.tId, {Key? key}) : super(key: key);

  @override
  State<knowMedDemo> createState() => _knowMedDemoState();
}

class _knowMedDemoState extends State<knowMedDemo> {
  KnowMed_Controller controller = Get.put(KnowMed_Controller());
  KnowMed_Model modal = KnowMed_Model();
  OptionList option_data = OptionList();
  int list_index = 0;
  ScrollController _controllerOne = ScrollController();

  Future getQuestionData() async {
    list_index=0;
   await modal.getQuizData(context, widget.sId, widget.tId);

  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      getQuestionData();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<KnowMed_Controller>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GetBuilder(
          init: KnowMed_Controller(),
          builder: (_) {
            return Center(
                child:  CommonWidgets().showNoData(
              title: 'Data Not Found',
              show: (modal.controller.getShowNoData &&
                  modal.controller.getQuestionsData.isEmpty),
              loaderTitle: 'Loading Questions',
              showLoader: (!modal.controller.getShowNoData &&
                  modal.controller.getQuestionsData.isEmpty),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.26,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      color: Colors.blue.shade900,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,0,0),
                    child: Scrollbar(
                      isAlwaysShown: true,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                                Icon(
                                  Icons.arrow_back_ios_sharp,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.height * 0.04,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "ABG Procedure",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: MediaQuery.of(context).size.height * 0.025),
                                ),
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                            Material(
                              borderRadius: BorderRadius.circular(10),
                              elevation: 2,
                              child: Column(
                                children: [
                                  SizedBox(height: MediaQuery.of(context).size.height *0.02,),
                                  SizedBox(
                                    width:MediaQuery.of(context).size.width * 0.8,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        controller.getColorsData.isEmpty?SizedBox():
                                       Icon(Icons.circle,color: controller.getColorsData[1].color_code!.toColor(),size: MediaQuery.of(context).size.height * 0.03,),
                                        Text("Wrong",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height * 0.02),),
                                        SizedBox(width: MediaQuery.of(context).size.width * 0.04,),
                                        controller.getColorsData.isEmpty?SizedBox():Icon(Icons.circle,color: controller.getColorsData[2].color_code!.toColor(),size: MediaQuery.of(context).size.height * 0.03),
                                        Text("Not Visited",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height * 0.02)),
                                        SizedBox(width: MediaQuery.of(context).size.width * 0.04,),
                                        controller.getColorsData.isEmpty?SizedBox():Icon(Icons.circle,color: controller.getColorsData[0].color_code!.toColor(),size: MediaQuery.of(context).size.height * 0.03),
                                        Text("Right",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height * 0.02)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height * 0.33,
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          12, 0, 12, 12),
                                      child: GridView.builder(
                                          padding: EdgeInsets.fromLTRB(0, 10,0,0),
                                          physics: const ScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: controller.getQuestionsData
                                              .length,
                                          gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 8,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            OptionList data = controller
                                                .getQuestionsData[index];
                                            ExamDashBoard exam_data = controller.getExamBoardData[index];
                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  list_index = index;
                                                });
                                              },
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: list_index+1 == modal.controller.getQuestionsData[index].serial_number?Colors.white:exam_data.isAttempted ==1 && exam_data.isCorrect == false?controller.getColorsData[1].color_code!.toColor():exam_data.isAttempted ==1 && exam_data.isCorrect == true?controller.getColorsData[0].color_code!.toColor():controller.getColorsData[2].color_code!.toColor(),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(5)),
                                                    border: Border.all(color: modal.controller.getColorsData[2].color_code!.toColor()),
                                                  ),
                                                  child: Text(
                                                    data.serial_number.toString(),
                                                    style: TextStyle(color: list_index+1 == modal.controller.getQuestionsData[index].serial_number?Colors.black: Colors.white),
                                                    textAlign: TextAlign.center,)
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                            modal.controller.getQuestionsData.isEmpty?SizedBox():
                            Padding(
                              padding:  EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height * 0.02,0,MediaQuery.of(context).size.height * 0.02),
                              child: Text("Question No. ${modal.controller.getQuestionsData[list_index].serial_number.toString()}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * 0.023),),
                            ),
                            modal.controller.getQuestionsData.isEmpty?SizedBox():
                             ListView.builder(padding: EdgeInsets.zero,physics: NeverScrollableScrollPhysics(),itemCount: 1,shrinkWrap: true,itemBuilder: (BuildContext context,int index){
                                  ExamDashBoard exam = controller.getExamBoardData[list_index];
                                  return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0,0,20,0),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height * 0.27,
                                            color: Colors.lightBlue.shade50,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Scrollbar(
                                                isAlwaysShown : true,
                                                controller: _controllerOne,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(modal.controller.getQuestionsData[list_index].question.toString(),
                                                          style: TextStyle(
                                                              fontSize: MediaQuery.of(context).size.height * 0.022, fontWeight: FontWeight.w600)),
                                                      SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                                                      controller.getQuestionsData.isEmpty?SizedBox():
                                                      ListView.separated(
                                                        controller: _controllerOne,
                                                        padding : EdgeInsets.zero,
                                                        physics: NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          itemBuilder: (BuildContext context, int index){
                                                            OptionList data = controller
                                                                .getQuestionsData[list_index];
                                                            OptionDetails option_data = controller.getQuestionsData[list_index].optionDetails![index];
                                                            return exam.isAttempted == 0?
                                                              Container(
                                                              child:
                                                              InkWell(
                                                                onTap: ()async{
                                                                  controller.questionId.value = data.id.toString();
                                                                  controller.optionTap.value = option_data.id.toString();

                                                                  modal.onPressedOption(list_index, index,  );
                                                                 await modal.onOptionTap(context);
                                                                },
                                                                child: Row(
                                                                  children: [
                                                                    Icon(jsonDecode(controller.options_data[list_index]['optionDetails'])[index]['isSelected']? Icons.check_circle:Icons.circle_outlined,size: MediaQuery.of(context).size.height * 0.032,),
                                                                    SizedBox(width: 20,),
                                                                    Flexible(child: Text(option_data.option.toString(),style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.018),)),
                                                                  ],
                                                                ),
                                                              ),
                                                            ):Container(
                                                              color: option_data.id == exam.correct_OptionId?Colors.green.shade100:option_data.id !=exam.correct_OptionId && option_data.id == exam.selected_Optionid?Colors.red.shade100:Colors.transparent,
                                                              child: Row(
                                                                  children: [
                                                                    (option_data.id == exam.correct_OptionId)?Icon(Icons.check_circle,color: Colors.green,size: MediaQuery.of(context).size.height * 0.032,):(option_data.id != exam.correct_OptionId && option_data.id == exam.selected_Optionid)?Icon(Icons.clear,color: Colors.red,size: MediaQuery.of(context).size.height * 0.032):Icon(Icons.circle_outlined,size: MediaQuery.of(context).size.height * 0.032,),
                                                                    SizedBox(width: 20,),
                                                                    Flexible(child: Text(option_data.option.toString(),style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.018),)),
                                                                  ],
                                                                ),
                                                            );
                                                          },
                                                          separatorBuilder: (BuildContext context,int index)=>SizedBox(height: 5,),
                                                          itemCount: controller.getQuestionsData[list_index].optionDetails!.length),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                }),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height * 0.03,20,MediaQuery.of(context).size.height * 0.028),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(onTap: (){
                                    setState(() {
                                      int new_index = list_index - 1;
                                      list_index = new_index;
                                    });
                                  },child: Visibility(
                                    visible: list_index == 0?false:true,
                                    child: Row(
                                      children: [
                                        Icon(Icons.arrow_back_ios),
                                        Text("Previous",style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.023,fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                  ),),
                                  InkWell(onTap: (){
                                    setState(() {
                                      int new_index = list_index + 1;
                                      list_index = new_index;
                                    });
                                  },child: Visibility(
                                    visible: list_index == 130?false:true,
                                    child: Row(
                                      children: [
                                        Text("Next",style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.023,fontWeight: FontWeight.w400),),
                                        Icon(Icons.arrow_forward_ios)
                                      ],
                                    ),
                                  ),),
                                ],
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,25,20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  controller.getExamBoardData.isEmpty?SizedBox():
                                  Visibility(
                                    visible:controller.getExamBoardData[0].totalAttemptedQuestion == 0?false:true,
                                    child: InkWell(onTap: ()async{
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const FeedbackAbgProcedure()));
                                        modal.getFeeback_KnowMedData(context);
                                        print("attempted questions: " + controller.getExamBoardData[0].totalAttemptedQuestion.toString());
                                    },child: Container(decoration: BoxDecoration(color: Colors.orangeAccent,borderRadius: BorderRadius.circular(20 )),width: MediaQuery.of(context).size.height * 0.43,height:MediaQuery.of(context).size.height * 0.05,child: Padding(
                                      padding:  EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.01, 0, 0),
                                      child: Text("Submit",style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.023,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                                    ),),),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            );
          },
        ),
      ),
    );
  }
}
