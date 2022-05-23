import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/Modal/imageBankList.dart';
import 'package:knowmed_flutter/Modal/questionListKnowledgeBank.dart';

class ImageBankDetailView extends StatelessWidget {
  final ImageList? image;
  final List? topicDetailList;
  final String? correctOpt;
  final String? correctImg;
  const ImageBankDetailView(this.image,  this.topicDetailList, this.correctImg, this.correctOpt, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

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
    isAlwaysShown: true,
    child:
      Container(
      color: Colors.lightBlue,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            // child:SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                    children: [
                      Text('Topic: ' + image!.subjectName.toString(),
                        style: MyTextTheme().largeBCB,),
                    ]
                ),

                Row(
                    children: [
                      // Text(que!.question.toString(), style: MyTextTheme().mediumBCB,),
                      Expanded(
                        // crossAxisAlignment: WrapCrossAlignment.start,
                        child: (
                            Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  // child: Text(questionList.question.toString(),
                                  //   style: MyTextTheme().mediumBCN,),
                                  child: Text(image!.question.toString(),
                                    style: MyTextTheme().mediumBCB,),
                                ),
                              ],
                            )
                        ),
                      ),
                    ]
                ),

                Expanded(
                  // crossAxisAlignment: WrapCrossAlignment.start,
                  child: (
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            // child: Text(questionList.question.toString(),
                            //   style: MyTextTheme().mediumBCN,),
                            child: Image.network(image!.questionImagePath.toString(),height: 250, width: 300,
                              alignment: Alignment.center,
                              errorBuilder: (context, error, stackTrace) {
                                return Image(image: AssetImage('assets/noimage.png'),
                                  height: 50,
                                  width: 50,);
                              },
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                Row(
                    children: [
                      Expanded(
                        child: (
                            Wrap(
                              children: [
                                Container(
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
                                                    crossAxisAlignment: WrapCrossAlignment.center,
                                                    children: [
                                                      Card(
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: Image.network(topicDetailList![0]['optionFilePath'].toString(),height: 50, width: 50,
                                                            errorBuilder: (context, error, stackTrace) {
                                                              return Image(image: AssetImage('assets/noimage.png'),
                                                                height: 50,
                                                                width: 50,);
                                                            },),
                                                        ),
                                                      ),
                                                      Column(
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
                                                              }, child: Text(topicDetailList![0]['optionName'].toString(),
                                                              style: MyTextTheme().mediumBCB,),
                                                            ),
                                                            /*const SizedBox(height: 2,),
                                                            Text('Subject3',
                                                              style: MyTextTheme().smallGCN,),*/
                                                          ]
                                                      )
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
                              ],
                            )
                        ),
                      ),
                    ]
                ),
                Row(
                    children: [
                      Expanded(
                        child: (
                            Wrap(
                              children: [
                                Container(
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
                                                    crossAxisAlignment: WrapCrossAlignment.center,
                                                    children: [
                                                      Card(
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: Image.network(topicDetailList![1]['optionFilePath'].toString(),height: 50, width: 50,
                                                            errorBuilder: (context, error, stackTrace) {
                                                              return Image(image: AssetImage('assets/noimage.png'),
                                                                height: 50,
                                                                width: 50,);
                                                            },),
                                                        ),
                                                      ),
                                                      Column(
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
                                                              }, child: Text(topicDetailList![1]['optionName'].toString(),
                                                              style: MyTextTheme().mediumBCB,),),
                                                          ]
                                                      )
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
                              ],
                            )
                        ),
                      ),
                    ]
                ),
                Row(
                    children: [
                      Expanded(
                        child: (
                            Wrap(
                              children: [
                                Container(
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
                                                    crossAxisAlignment: WrapCrossAlignment.center,
                                                    children: [
                                                      Card(
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: Image.network(topicDetailList![2]['optionFilePath'].toString(),height: 50, width: 50,
                                                            errorBuilder: (context, error, stackTrace) {
                                                              return Image(image: AssetImage('assets/noimage.png'),
                                                                height: 50,
                                                                width: 50,);
                                                            },),
                                                        ),
                                                      ),
                                                      Column(
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
                                                              }, child: Text(topicDetailList![2]['optionName'].toString(),
                                                              style: MyTextTheme().mediumBCB,),),
                                                          ]
                                                      )
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
                              ],
                            )
                        ),
                      ),
                    ]
                ),
                Row(
                    children: [
                      Expanded(
                        child: (
                            Wrap(
                              children: [
                                Container(
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
                                                    crossAxisAlignment: WrapCrossAlignment.center,
                                                    children: [
                                                      Card(
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: Image.network(topicDetailList![3]['optionFilePath'].toString(),height: 50, width: 50,
                                                            errorBuilder: (context, error, stackTrace) {
                                                              return Image(image: AssetImage('assets/noimage.png'),
                                                                height: 50,
                                                                width: 50,);
                                                            },),
                                                        ),
                                                      ),
                                                      Column(
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
                                                              }, child: Text(topicDetailList![3]['optionName'].toString(),
                                                              style: MyTextTheme().mediumBCB,),),
                                                          ]
                                                      )
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
                              ],
                            )
                        ),
                      ),
                    ]
                ),
                Row(
                    children: [
                      Expanded(
                        child: (
                            Wrap(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      // color: Colors.lightBlue,
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
                                            Text('Correct Answer  is:',
                                              style: MyTextTheme().mediumGCB,),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // ),
                                ),
                              ],
                            )
                        ),
                      ),
                    ]
                ),
                Row(
                    children: [
                      Expanded(
                        child: (
                            Wrap(
                              children: [
                                Container(
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
                                                    crossAxisAlignment: WrapCrossAlignment.center,
                                                    children: [
                                                      Card(
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: Image.network(correctImg!.toString(),height: 50, width: 50,
                                                            errorBuilder: (context, error, stackTrace) {
                                                              return Image(image: AssetImage('assets/noimage.png'),
                                                                height: 50,
                                                                width: 50,);
                                                            },),
                                                        ),
                                                      ),
                                                      Column(
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
                                                              }, child: Text(correctOpt!.toString(),
                                                              style: MyTextTheme().mediumBCB,),),
                                                          ]
                                                      )
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
                              ],
                            )
                        ),
                      ),
                    ]
                ),
                /*Row(
                    children: [
                      Expanded(
                        child: (
                            Wrap(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    // color: Colors.lightBlue,
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
                                            Text('Question Description',
                                              style: MyTextTheme().mediumGCB,),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // ),
                                ),
                              ],
                            )
                        ),
                      ),
                    ]
                ),
                Row(
                    children: [
                      Expanded(
                        child: (
                            Wrap(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    // color: Colors.lightBlue,
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
                                            Text('Correct Answer  is:',
                                              style: MyTextTheme().smallGCB,),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // ),
                                ),
                              ],
                            )
                        ),
                      ),
                    ]
                ),*/
              ],
            ),
            // ),
          ),
        ),
      ),
    )
    ),
    ),
    ],
    );
    throw UnimplementedError();
  }
}
