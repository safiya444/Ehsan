import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/beforscreen.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_post.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text_field_search.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/home/cloths/clothes_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ClothesView extends StatefulWidget {
  const ClothesView({super.key});

  @override
  State<ClothesView> createState() => _ClothesViewState();
}

class _ClothesViewState extends State<ClothesView> {
  ClothesController controller = Get.put(ClothesController());
  @override
  Widget build(BuildContext context) {
        DateTime timestamp = DateTime.now();
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
                            itemCount: controller.filtredClothesPosts.length,
                            itemBuilder: (BuildContext context, int index) {
                                 String formattedDate =
                                  DateFormat('yyyy-MM-dd – kk:mm').format(timestamp);
                              return Column(
                                children: [
                                  CustomPost(
                                    requesttype: controller
                                            .filtredClothesPosts[index]
                                            .typeOrder ??
                                        '',
                                    content: controller
                                            .filtredClothesPosts[index].content ??
                                        '',
                                    address: controller
                                            .filtredClothesPosts[index].site ??
                                        '',
                                    linkTelegram: controller.filtredClothesPosts[index].linkTelegram??'', formtedate: formattedDate,
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

              controller.GetAllClothesPosts();
              setState(() {});
            }),
      ],
    );
  }
}
