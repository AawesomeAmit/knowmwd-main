
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knowmed_flutter/Pages/Video/videoList_controller.dart';
import 'package:knowmed_flutter/Pages/Video/videoList_modal.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:knowmed_flutter/AppManager/alert_dialogue.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_app_bar.dart';
import 'package:knowmed_flutter/Services/tab_responsive.dart';

import '../../Modal/videoList.dart';
import '../common_widgets.dart';

class VideoListView extends StatefulWidget {
  const VideoListView({Key? key}) : super(key: key);

  @override
  _VideoListViewState createState() => _VideoListViewState();
}

class _VideoListViewState extends State<VideoListView> {
  VideoListModal modal=VideoListModal();
  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose(){
    // Don't forget to dispose the ScrollController.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    modal.getVideoList(context);
    return Container(
      color: AppColor.white,
      child: SafeArea(
        child: Scaffold(
          appBar: MyWidget().myAppBar(context,
            title: 'Videos',
            bgColor: AppColor.primaryColorDark,
            // subtitle: modal.dashC.selectedDepartment.value.subDepartmentName,
          ),
          body: GetBuilder(
              init: VideoListController(),
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
                        itemBuilder: (context,index) {
                          ResponseValue videoList =
                          modal.controller
                              .videoList.isEmpty ?
                          ResponseValue(
                              subjectId: 0,
                              subjectName: '',
                              subjectImagePath: '',
                          ) :
                          modal.controller.videoList[index];
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        const SizedBox(width: 8,),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            children: [
                                              Wrap(
                                                crossAxisAlignment: WrapCrossAlignment
                                                    .center,
                                                children: [
                                                  Card(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .all(5.0),
                                                      child: SvgPicture.network(
                                                        videoList.subjectImagePath
                                                            .toString(),
                                                        fit: BoxFit.cover,
                                                        height: 45,
                                                        width: 45,
                                                        placeholderBuilder: (context) {
                                                          return Image(
                                                            image: AssetImage(
                                                                'assets/noimage.png'),
                                                            fit: BoxFit.cover,
                                                            height: 45,
                                                            width: 45,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        TextButton(
                                                          style: TextButton
                                                              .styleFrom(
                                                              primary: Colors
                                                                  .black,
                                                              padding: const EdgeInsets
                                                                  .fromLTRB(
                                                                  8, 8, 8, 8),
                                                              minimumSize: const Size(
                                                                  0, 0),
                                                              tapTargetSize: MaterialTapTargetSize
                                                                  .shrinkWrap
                                                          ),
                                                          onPressed: () {
                                                            /*modal
                                                                .onPressSubject(
                                                                context,
                                                                videoList.id!
                                                                    .toInt());*/
                                                          }, child: Text(
                                                            videoList
                                                                .subjectName
                                                                .toString(),
                                                          style:
                                                          MyTextTheme().mediumBCB,),),
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
                          );
                        },

                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.fit(
                                TabResponsive().isTab(context)? 2:4
                            ),
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,),
                    )
                    )
                  ],
                );
              }
          ),
        ),
      ),
    );
  }

}
