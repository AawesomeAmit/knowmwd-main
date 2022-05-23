
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_app_bar.dart';
import 'package:knowmed_flutter/Modal/imageBankList.dart';
import 'package:knowmed_flutter/Modal/questionListKnowledgeBank.dart';
import 'package:knowmed_flutter/Modal/subjectListKnowledgeBank.dart';
import 'package:knowmed_flutter/Modal/topicListKnowledgeBank.dart';
import 'package:knowmed_flutter/Pages/Dashboard/dashboard_modal.dart';
import 'package:knowmed_flutter/Pages/KnowledgeBank/knowledgeBank_controller.dart';
import 'package:knowmed_flutter/Pages/KnowledgeBank/knowledgeBank_modal.dart';
import 'package:knowmed_flutter/Services/tab_responsive.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../common_widgets.dart';
import 'ImageBank_controller.dart';
import 'ImageBank_modal.dart';

class ImageBankView extends StatefulWidget {
  const ImageBankView({Key? key}) : super(key: key);

  @override
  _ImageBankViewState createState() => _ImageBankViewState();
}

class _ImageBankViewState extends State<ImageBankView> {
  ImageBankModal modal=ImageBankModal();
  String? _chosenSubject;
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
    modal.getQuestionList(context, '0', '0');
    modal.getSubjectList(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,40,0,10),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios,color: Colors.white,),
                      SizedBox(width: 10,),
                      Text("Image Bank",style:TextStyle(fontSize: 18,color: Colors.white),)
                    ],
                  ),
                ),
                Divider(thickness: 1,color: Colors.blue.shade50,indent: 10,endIndent: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,5,0,15),
                      child: Text('Topic wise search\nGet details about selected topic',
                        style: MyTextTheme().largeWCN,),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40,10,40,20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          height: 40,
                          //width: 150,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColor.greyLight, width: 1),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child:DropdownSearch<ResponseValue3>(
                           label: "Select Subject",
                            items: modal.controller.getSubjectList,
                            mode: Mode.MENU,
                            dropdownSearchDecoration: InputDecoration(
                              // labelText: "Person",
                              // contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                              alignLabelWithHint: true,
                              border: UnderlineInputBorder(borderSide:BorderSide.none),
                            ),
                            popupItemBuilder: (context, item, isSelected) => _subjectDropDown(context, item),
                            // onFind: (String filter) => getData(filter),
                            itemAsString: (item) => item!.subjectName.toString(),
                            onChanged: (item) => {
                              print(item?.id.toString()),
                              _chosenSubject=item?.id.toString(),
                              modal.getSubjectWiseTopicList(context, item!.id.toString())
                            },
                          ),
                          /*DropdownButton<String>(
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
                            *//*items: <String>[
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
                            }).toList(),*//*
                            hint:Text("Select Subject",
                              style: MyTextTheme().mediumBCB,),
                            onChanged: (value) {
                              setState(() {
                                _chosenValue = value;
                                // value! as ResponseValue3?;
                              });
                            },
                          ),*/
                        ),
                      ),
                      Flexible(child:
                      Container(
                        height: 40,
                        //width: 150,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                            border: Border.all(color: AppColor.greyLight, width: 1),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child:DropdownSearch<ResponseValue2>(
                         dropdownSearchTextAlignVertical: TextAlignVertical.bottom,
                          items: modal.controller.getTopicList,
                          mode: Mode.MENU,
                          dropdownSearchDecoration: const InputDecoration(
                            labelText: "Select Topic",
                            alignLabelWithHint: true,
                            // contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 20),
                            border: UnderlineInputBorder(borderSide:BorderSide.none),
                          ),
                          popupItemBuilder: (context, item, isSelected) => _topicDropDown(context, item),
                          // onFind: (String filter) => getData(filter),
                          itemAsString: (item) => item!.topicName.toString(),
                          onChanged: (item) => {
                            print(item?.id.toString()),
                            modal.getQuestionList(context, _chosenSubject.toString(), item!.id.toString())
                          },
                        ),
                        /*DropdownButton<String>(
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
                              ),*/
                      ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //height: MediaQuery.of(context).size.height * 0.26,
           // width: double.infinity,

            decoration: BoxDecoration(
              color:Colors.blue.shade900,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
            ),
          ),
          Expanded(
            child: Scrollbar(
                isAlwaysShown: true,
                child:
                GetBuilder(
                    init: ImageBankController(),
                    builder: (_) {
                      return Column(
                        children: [

                          CommonWidgets().showNoData(
                              color: AppColor.white,
                              title: 'Data Not Found',
                              show: modal.controller.getShowNoData,
                              child:   Expanded(
                                child: StaggeredGridView.countBuilder(
                                  crossAxisCount: 4,
                                  itemCount: modal.controller.imageList.isEmpty?
                                  5 :
                                  modal.controller.getImageList.length,
                                  // modal.controller.getQuestionList.length,
                                  itemBuilder: (context,index){
                                    ImageList imageList=modal.controller.getImageList.isEmpty?
                                    ImageList(
                                        id: 0,
                                        question: '',
                                        description: '',
                                        subjectName: '',
                                        isBookmarked: 0,
                                        questionTypeId: 0,
                                        questionImagePath: "",
                                        optionList: ""
                                    ):
                                    modal.controller.getImageList[index];
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
                                        decoration: BoxDecoration(
                                            color: Colors.blue.shade50,
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
                                                                modal.onPressQuestion(context, imageList);
                                                              }, child: Text(imageList.question.toString()),),
                                                          ),
                                                          color: Colors.blue.shade50,
                                                          elevation: 0,
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
                                                      imageList.isBookmarked==1? SvgPicture.asset('assets/bookmark1.svg'):
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
                )
            ),
          ),
        ],
      ),
    );

  }
  Widget _subjectDropDown(BuildContext context, ResponseValue3? item) {
    if (item == null) {
      return Container();
    }

    return Container(
      child: (item.subjectName == null)
          ? ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(),
        title: Text("No item selected"),
      )
          : ListTile(
        contentPadding: EdgeInsets.all(0),
        /*leading: CircleAvatar(
          // this does not work - throws 404 error
          // backgroundImage: NetworkImage(item.avatar ?? ''),
        ),*/
        title: Text(item.subjectName.toString()),
        subtitle: Text(
          item.id.toString(),
        ),
      ),
    );
  }
  Widget _topicDropDown(BuildContext context, ResponseValue2? item) {
    if (item == null) {
      return Container();
    }

    return Container(
      child: (item.topicName == null)
          ? ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(),
        title: Text("No item selected"),
      )
          : ListTile(
        contentPadding: EdgeInsets.all(0),
        // leading: CircleAvatar(
        //   // this does not work - throws 404 error
        //   // backgroundImage: NetworkImage(item.avatar ?? ''),
        // ),
        title: Text(item.topicName.toString()),
        subtitle: Text(
          item.id.toString(),
        ),
      ),
    );
  }
}