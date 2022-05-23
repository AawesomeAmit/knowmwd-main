import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knowmed_flutter/AppManager/alert_dialogue.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/user_data.dart';
import 'package:knowmed_flutter/Modal/DashboardModal.dart';
import 'package:knowmed_flutter/Pages/Dashboard/dashboard_controller.dart';
import 'package:knowmed_flutter/Pages/Dashboard/dashboard_modal.dart';
import 'package:knowmed_flutter/Pages/common_widgets.dart';
import 'package:knowmed_flutter/Services/tab_responsive.dart';
import 'package:get/get.dart';
class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  UserData user = UserData();
  bool _openMenu = false;
  bool showMenuButton = false;
  String _radioSelected = '1';
  String _radioVal = '';
  DashboardModal modal = DashboardModal();

  late ScrollController _scrollC;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  @override
  void dispose() {
    // Don't forget to dispose the ScrollController.
    _scrollC.dispose();
    super.dispose();
  }

  get() async {
    _scrollC = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollC.offset >= _scrollC.position.maxScrollExtent &&
              !_scrollC.position.outOfRange) {
            setState(() {
              showMenuButton = false;
              //   title = "reached the bottom";
            });
          } else if (_scrollC.offset <= _scrollC.position.minScrollExtent &&
              !_scrollC.position.outOfRange) {
            setState(() {
              showMenuButton = false;
              // title = "reached the top";
            });
          } else {
            setState(() {
              showMenuButton = false;
              // title = prevTitle;
            });
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    modal.onLoad(context);
    return Container(
      color: AppColor.white,
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            await AlertDialogue().show(context,
                msg: 'Do you want to exit the app?',
                showCancelButton: true,
                showOkButton: false,
                firstButtonName: 'Exit', firstButtonPressEvent: () {
              exit(0);
            });
            setState(() {});
            return Future.value(false);
          },
          child: Scaffold(
            backgroundColor: Colors.white12,
            appBar: AppBar(title: Text('Dashboard'),backgroundColor: Colors.blue.shade900,),
            body: GetBuilder(
              init: DashboardController(),
              builder: (_) {
                return Stack(
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
                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                        child: Scrollbar(
                            isAlwaysShown: false,
                            child:
                  SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Question of the day',
                              style: MyTextTheme().largeWCB,
                            ),
                          ),
                        ]),
                        TabResponsive().wrapInTab(
                          context: context,
                          child: Container(
                            height: 300,
                            width: 340,
                            decoration: BoxDecoration(
                              color: AppColor.greyLighter,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              // border: Border.all(color: AppColor.greyLight)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Form(
                                key: modal.controller.formKey.value,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Row(children: [
                                        Expanded(
                                          child: (Wrap(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(0.0),
                                                child: Text(
                                                    modal
                                                        .controller
                                                        .getquestionOfTheDay.isEmpty?"":
                                                  modal
                                                      .controller
                                                      .getquestionOfTheDay[0]
                                                      .question
                                                      .toString(),
                                                  style: MyTextTheme().mediumBCB,
                                                ),
                                              ),
                                            ],
                                          )),
                                        ),
                                      ]),
                                      Expanded(child:CommonWidgets().showNoData(
                                        show: modal.controller.getShowNoData,
                                        child: StaggeredGridView.countBuilder(
                                          crossAxisCount: 4,
                                          itemCount: modal
                                              .controller
                                              .getquestionOfTheDay.isEmpty?0:modal
                                              .controller
                                              .getquestionOfTheDay[0]
                                              .options!
                                              .length,
                                          itemBuilder: (context, index) {
                                            Option option = modal
                                                .controller
                                                .getquestionOfTheDay[0]
                                                .options!
                                                .isEmpty
                                                ? Option(
                                              sAlpha: '',
                                              id: 0,
                                              questionId: 0,
                                              optionName: '',
                                            )
                                                : modal
                                                .controller
                                                .getquestionOfTheDay[0]
                                                .options![index];
                                            return Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  1, 5, 1, 5),
                                              child:Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Radio(
                                                    value: option.optionName.toString(),
                                                    groupValue: _radioSelected,
                                                    activeColor: Colors.blue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _radioSelected =
                                                            value.toString();
                                                        _radioVal = option
                                                            .optionName
                                                            .toString();
                                                        // alertToast(context, value.toString());
                                                      });
                                                    },
                                                  ),
                                                  Text(option.optionName
                                                      .toString()),
                                                ],
                                              ),
                                            );
                                          },
                                          staggeredTileBuilder: (int index) =>
                                              StaggeredTile.fit(
                                                  TabResponsive().isTab(context)
                                                      ? 2
                                                      : 4),
                                          mainAxisSpacing: 0.0,
                                          crossAxisSpacing: 0.0,
                                        ),
                                      ),),


                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Suggested Mock Test',
                              style: MyTextTheme().largeBCB,
                            ),
                          ),
                        ]),
                        SizedBox(
                            height: 170,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  modal.controller.getSuggestedMockTestList.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  width: 150,
                                  height: 150,
                                  // color: selectedIndex==index?Colors.green:Colors.red,//now suppose selectedIndex and index from this builder is same then it will show the selected as green and others in red color
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: InkWell(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColor.greyLighter,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 5, 5, 10),
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: [
                                                        Wrap(
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .center,
                                                          children: [
                                                            Card(
                                                              child: Center(
                                                                child: SvgPicture
                                                                    .network(
                                                                  modal
                                                                      .controller
                                                                      .getSuggestedMockTestList[
                                                                          index]
                                                                      .imagePath
                                                                      .toString(),
                                                                  fit: BoxFit.cover,
                                                                  height: 45,
                                                                  width: 45,
                                                                  placeholderBuilder:
                                                                      (context) {
                                                                    return Image(
                                                                      image: AssetImage(
                                                                          'assets/noimage.png'),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      height: 45,
                                                                      width: 45,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    modal
                                                                        .controller
                                                                        .getSuggestedMockTestList[
                                                                            index]
                                                                        .subjectName
                                                                        .toString(),
                                                                    style:
                                                                        MyTextTheme()
                                                                            .mediumBCB,
                                                                  ),
                                                                  Container(
                                                                      margin: const EdgeInsets
                                                                          .all(5),
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              2,
                                                                          vertical:
                                                                              2),
                                                                      width: 200,
                                                                      decoration: BoxDecoration(
                                                                          border: Border.all(
                                                                              color: AppColor
                                                                                  .greyLight,
                                                                              width:
                                                                                  1),
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  20)),
                                                                      child:
                                                                          const LinearProgressIndicator(
                                                                        value: 10,
                                                                        // color: ''.toColor(),
                                                                        // value: controller.value,
                                                                      )),
                                                                  const SizedBox(
                                                                    height: 2,
                                                                  ),
                                                                  Text(
                                                                    modal
                                                                            .controller
                                                                            .getSuggestedMockTestList[
                                                                                index]
                                                                            .attempted
                                                                            .toString() +
                                                                        '/' +
                                                                        modal
                                                                            .controller
                                                                            .getSuggestedMockTestList[
                                                                                index]
                                                                            .topicCount
                                                                            .toString() +
                                                                        ' completed',
                                                                    style:
                                                                        MyTextTheme()
                                                                            .smallGCN,
                                                                  ),
                                                                ])
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        // ),
                                      ),
                                      onTap: () {
                                        modal.onPressMockTest(
                                            context,
                                            modal.controller
                                                .getSuggestedMockTestList[index].id!
                                                .toInt());
                                        modal.onPressSubject(context, (modal.controller.getSuggestedMockTestList[index].topicDetails??[]), modal.controller.getSuggestedMockTestList[index].id.toString());
                                      },
                                    ),
                                  ),
                                );
                              },
                            )),
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Quick Links',
                              style: MyTextTheme().largeBCB,
                            ),
                          ),
                        ]),
                        Table(
                          border: TableBorder.all(color: Colors.transparent),
                          children: [
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          child: SvgPicture.asset(
                                            'assets/quiz_bank.svg',
                                            fit: BoxFit.cover,
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                        Text(
                                          'Quiz Bank',
                                          style: MyTextTheme().largeBCB,
                                        ),
                                      ]),
                                    ),
                                    onTap: () {
                                      modal.onPressOptions(context, 2);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          child: SvgPicture.asset(
                                            'assets/mock_test1.svg',
                                            fit: BoxFit.cover,
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                        Text(
                                          'Mock Test',
                                          style: MyTextTheme().largeBCB,
                                        ),
                                      ]),
                                    ),
                                    onTap: () {
                                      modal.onPressOptions(context, 3);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          child: SvgPicture.asset(
                                            'assets/past_exam.svg',
                                            fit: BoxFit.cover,
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                        Text(
                                          'Past Exams',
                                          style: MyTextTheme().largeBCB,
                                        ),
                                      ]),
                                    ),
                                    onTap: () {
                                      modal.onPressOptions(context, 4);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          child: SvgPicture.asset(
                                            'assets/perls.svg',
                                            fit: BoxFit.cover,
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                        Text(
                                          'Perls',
                                          style: MyTextTheme().largeBCB,
                                        ),
                                      ]),
                                    ),
                                    onTap: () {
                                      modal.onPressOptions(context, 5);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          child: SvgPicture.asset(
                                            'assets/image_bank.svg',
                                            fit: BoxFit.cover,
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                        Text(
                                          'Images Bank',
                                          style: MyTextTheme().largeBCB,
                                        ),
                                      ]),
                                    ),
                                    onTap: () {
                                      modal.onPressOptions(context, 6);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          child: SvgPicture.asset(
                                            'assets/bookmark3.svg',
                                            fit: BoxFit.cover,
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                        Text(
                                          'Bookmark',
                                          style: MyTextTheme().largeBCB,
                                        ),
                                      ]),
                                    ),
                                    onTap: () {
                                      modal.onPressOptions(context, 7);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          child: SvgPicture.asset(
                                            'assets/videos.svg',
                                            fit: BoxFit.cover,
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                        Text(
                                          'Videos',
                                          style: MyTextTheme().largeBCB,
                                        ),
                                      ]),
                                    ),
                                    onTap: () {
                                      modal.onPressOptions(context, 8);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          child: SvgPicture.asset(
                                            'assets/custom_module.svg',
                                            fit: BoxFit.cover,
                                            height: 25,
                                            width: 25,
                                          ),
                                        ),
                                        Text(
                                          'Custom Module',
                                          style: MyTextTheme().largeBCB,
                                        ),
                                      ]),
                                    ),
                                    onTap: () {
                                      modal.onPressOptions(context, 9);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          child: SvgPicture.asset(
                                            'assets/statistics.svg',
                                            fit: BoxFit.cover,
                                            height: 35,
                                            width: 35,
                                          ),
                                        ),
                                        Text(
                                          'Statistics',
                                          style: MyTextTheme().largeBCB,
                                        ),
                                      ]),
                                    ),
                                    onTap: () {
                                      modal.onPressOptions(context, 10);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          child: null,
                                        ),
                                        Text(
                                          '',
                                          style: MyTextTheme().largeBCB,
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Suggested Videos',
                              style: MyTextTheme().largeBCB,
                            ),
                          ),
                        ]),
                        SizedBox(
                            height: 250,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  modal.controller.getSuggestedVideoList.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  width: 230,
                                  height: double.infinity,
                                  // color: selectedIndex==index?Colors.green:Colors.red,//now suppose selectedIndex and index from this builder is same then it will show the selected as green and others in red color
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: InkWell(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColor.greyLighter,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 5, 5, 10),
                                          child: Column(
                                            children: [
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  SvgPicture.network(
                                                    modal
                                                        .controller
                                                        .getSuggestedVideoList[
                                                            index]
                                                        .thumbNail
                                                        .toString(),
                                                    fit: BoxFit.cover,
                                                    height: 200,
                                                    width: 200,
                                                    placeholderBuilder: (context) {
                                                      return Image(
                                                        image: AssetImage(
                                                            'assets/noimage.png'),
                                                        fit: BoxFit.cover,
                                                        height: 200,
                                                        width: 200,
                                                      );
                                                    },
                                                  ),
                                                  Positioned(
                                                    bottom: 0,
                                                    left: 5,
                                                    child: Container(
                                                      width: 300,
                                                      color: Colors.transparent,
                                                      padding:
                                                          const EdgeInsets.all(10),
                                                      child: Text(
                                                        modal
                                                            .controller
                                                            .getSuggestedVideoList[
                                                                index]
                                                            .topicName
                                                            .toString(),
                                                        style:
                                                            MyTextTheme().smallGCB,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          // ],
                                        ),
                                      ),
                                      onTap: () {
                                            modal.onPressVideo(context, modal
                                                .controller
                                                .getSuggestedVideoList[index]
                                                .videoPath
                                                .toString(), modal
                                                .controller
                                                .getSuggestedVideoList[index]
                                                .topicName
                                                .toString());
                                      },
                                    ),
                                  ),
                                );
                              },
                            )),
                      ],
                    ),
                  ),
                ),
                )
                ),
                    ],
                );
              }
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(''),
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: SvgPicture.asset('assets/home.svg'),
                      onPressed: () {},
                    ),
                    title: const Text('Dashboard'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: SvgPicture.asset('assets/test.svg'),
                      onPressed: () {},
                    ),
                    title: const Text('Quiz Bank'),
                    onTap: () {
                      modal.onPressOptions(context, 2);
                    },
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: SvgPicture.asset('assets/exam.svg'),
                      onPressed: () {},
                    ),
                    title: const Text('Mock Test'),
                    onTap: () {
                      modal.onPressOptions(context, 3);
                    },
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: SvgPicture.asset('assets/online-question.svg'),
                      onPressed: () {},
                    ),
                    title: const Text('Past Exams'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: SvgPicture.asset('assets/pearl.svg'),
                      onPressed: () {},
                    ),
                    title: const Text('Pearls'),
                    onTap: () {
                      modal.onPressOptions(context, 5);
                    },
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: SvgPicture.asset('assets/image.svg'),
                      onPressed: () {},
                    ),
                    title: const Text('Image Bank'),
                    onTap: () {
                      modal.onPressOptions(context, 6);
                    },
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: SvgPicture.asset('assets/bookmark.svg'),
                      onPressed: () {},
                    ),
                    title: const Text('Book Mark'),
                    onTap: () {
                      modal.onPressOptions(context, 7);
                    },
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: SvgPicture.asset('assets/video.svg'),
                      onPressed: () {},
                    ),
                    title: const Text('Videos'),
                    onTap: () {
                      modal.onPressOptions(context, 8);
                    },
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: SvgPicture.asset('assets/modules.svg'),
                      onPressed: () {},
                    ),
                    title: const Text('Custom Module'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: SvgPicture.asset('assets/bar-chart.svg'),
                      onPressed: () {},
                    ),
                    title: const Text('Statistics'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: SvgPicture.asset('assets/logout.svg'),
                      onPressed: () {},
                    ),
                    title: const Text('Change Password'),
                    onTap: () {
                      modal.onPressOptions(context, 11);
                      // Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: SvgPicture.asset('assets/logout.svg'),
                      onPressed: () {},
                    ),
                    title: const Text('Logout'),
                    onTap: () {
                      modal.onPressOptions(context, 12);
                      // Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: AnimatedContainer(
              height: showMenuButton ? 60 : 0,
              duration: const Duration(milliseconds: 500),
              child: FloatingActionButton(
                backgroundColor: AppColor.primaryColor,
                child: !_openMenu
                    ? SvgPicture.asset('assets/menu.svg')
                    : Icon(
                        _openMenu ? Icons.clear : Icons.menu,
                        size: showMenuButton ? 25 : 0,
                      ),
                onPressed: () {
                  _openMenu = !_openMenu;
                  setState(() {});
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
