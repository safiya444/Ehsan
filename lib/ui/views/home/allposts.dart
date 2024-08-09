import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/beforscreen.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_post.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text_field_search.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/home/home_controller.dart';
import 'package:empty_code/ui/views/post_request/post_request_controlle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class AllPostView extends StatefulWidget {
  const AllPostView({super.key});

  @override
  State<AllPostView> createState() => _AllPostViewState();
}

class _AllPostViewState extends State<AllPostView> {
  HomeController controller = Get.put(HomeController());
  PostRequestController controller1 = Get.put(PostRequestController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RefreshIndicator(
            backgroundColor: AppColors.GreenLightApp,
            color: AppColors.whiteColor,
            child: Column(
              children: [
                SizedBox(
                  height: screenWidth(25),
                ),
                Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: AppColors.graylightColor,
                          blurRadius: 1.5,
                          offset: Offset(2, 2))
                    ]),
                    width: screenWidth(1.1),
                    height: screenWidth(6),
                    child: SerchTextField(
                      controller: controller.textEditingController,
                      onChanged: (value) {
                        controller.updateList(value);
                      },
                    )),
                SizedBox(
                  height: screenWidth(15),
                ),
                Obx(() {
                  return controller.isLoadingData.value
                      ? SizedBox(
                          height: screenWidth(0.5),
                          width: screenWidth(1.12),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: 7,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Shimmer.fromColors(
                                      baseColor:
                                          Color.fromARGB(255, 219, 218, 218),
                                      highlightColor:
                                          Color.fromARGB(255, 202, 200, 200),
                                      child: BeforScreen(
                                        height: screenWidth(1.7),
                                        width: screenWidth(1.1),
                                      )),
                                  SizedBox(
                                    height: screenWidth(12),
                                  )
                                ],
                              );
                            },
                          ))
                      : SizedBox(
                          height: screenWidth(0.5),
                          width: screenWidth(1.12),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: controller.filtredPosts.length,
                            itemBuilder: (BuildContext context, int index) {
                          
                              return Column(
                                children: [
                                  CustomPost(
                                    requesttype: controller
                                            .filtredPosts[index].typeOrder ??
                                        '',
                                    content: controller
                                            .filtredPosts[index].content ??
                                        '',
                                    address:
                                        controller.filtredPosts[index].site ??
                                            '',
                                    linkTelegram: controller
                                            .filtredPosts[index].linkTelegram ??
                                        '',
                                    formtedate: controller.filtredPosts[index].createdAt??'',
                                  ),
                                  SizedBox(
                                    height: screenWidth(12),
                                  )
                                ],
                              );
                            },
                          ));
                })
              ],
            ),
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 2));

              controller.GetAllPosts();
              setState(() {});
            }),
      ],
    );
  }
}
