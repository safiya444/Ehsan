import 'dart:io';

import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text_feild1.dart';
import 'package:empty_code/ui/shared/custom_widget/image_dialoge.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/home/home_view.dart';
import 'package:empty_code/ui/views/main/main_view.dart';
import 'package:empty_code/ui/views/post_request/post_request_controlle.dart';
import 'package:empty_code/ui/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class PostRequestView extends StatefulWidget {
  const PostRequestView({super.key});

  @override
  State<PostRequestView> createState() => _PostRequestViewState();
}

class _PostRequestViewState extends State<PostRequestView> {
  PostRequestController controller = Get.put(PostRequestController());
  void selectImages() async {
    final List<XFile> selectedImages =
        await controller.imagePicker.pickMultiImage();

    if (selectedImages!.isNotEmpty) {
      setState(() {
        controller.imageFileList.addAll(selectedImages);
      });
    }
  }

  int selectedImageIndex = 0;

  void DeleteSelectedImage() {
    if (selectedImageIndex != null) {
      setState(() {
        controller.imageFileList.removeAt(selectedImageIndex);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // String url = controller.TelgramUrlController.text;
    //final Uri urltelegram = Uri.parse(url);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: screenWidth(6),
          title: CustomText(
            text: 'نشر التبرع',
            styleType: TextStyleType.NAME,
            textColor: AppColors.GreenApp,
          ),
          centerTitle: true,
          backgroundColor: AppColors.GreenLightApp,
          leading: IconButton(
              onPressed: () {
                Get.to(HomeView());
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: screenWidth(15),
                color: AppColors.GreenApp,
              )),
        ),
        body: Form(
          key: controller.formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: screenWidth(12), start: screenWidth(30)),
                    child: Row(
                      children: [
                        Text(
                          "نوع التبرع:",
                          style: TextStyle(
                              fontSize: screenWidth(20),
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: screenWidth(10),
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenWidth(20)),
                              border: Border.all(
                                  color: AppColors.GreenApp, width: 3)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              icon: Icon(Icons.arrow_drop_down),
                              iconEnabledColor: AppColors.GreenApp,
                              iconSize: screenWidth(10),
                              hint: Text(
                                "اختر نوع تبرعك  ",
                                textAlign: TextAlign.end,
                                style: TextStyle(fontSize: screenWidth(20)),
                              ),
                              items: [
                                'ألبسة',
                                'مواد غذائية',
                                'أدوية',
                                'أدوات كهربائية',
                                'أدوات منزلية',
                                'مبلغ مالي'
                              ]
                                  .map((e) => DropdownMenuItem(
                                        child: Text("$e"),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  controller.selecteditem = val;
                                });
                              },
                              value: controller.selecteditem,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth(1.4), top: screenWidth(6)),
                    child: Text(
                      "التفاصيل:",
                      style: TextStyle(
                          fontSize: screenWidth(20),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: screenWidth(25), left: screenWidth(30)),
                      width: screenWidth(1.1),
                      height: screenWidth(4),
                      child: Custom_Text_Feild1(
                          controller: controller.ContentController,
                          hintText: 'شرح عن الطلب..',
                          hintTextColor: AppColors.graylightColor,
                          textInputType: TextInputType.text)),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth(1.3), top: screenWidth(20)),
                    child: Text(
                      "الموقع:",
                      style: TextStyle(
                          fontSize: screenWidth(20),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: screenWidth(25),
                          left: screenWidth(30),
                          bottom: screenWidth(20)),
                      width: screenWidth(1.1),
                      height: screenWidth(6),
                      child: Custom_Text_Feild1(
                          controller: controller.siteController,
                          hintText: '',
                          hintTextColor: AppColors.whiteColor,
                          textInputType: TextInputType.text)),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        end: screenWidth(2.5),
                        top: screenWidth(20),
                        bottom: screenWidth(10)),
                    child: Text(
                      "للتواصل عبر التلجرام:",
                      style: TextStyle(
                          fontSize: screenWidth(18),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "ادخل اسم المستخدم لديك في تلجرام(بدون@):",
                    style: TextStyle(
                        fontSize: screenWidth(21), fontWeight: FontWeight.bold),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        top: screenWidth(25),
                        left: screenWidth(30),
                      ),
                      width: screenWidth(1.1),
                      height: screenWidth(6),
                      child: Custom_Text_Feild1(
                          controller: controller.UserNamecontroller,
                          hintText: 'اسم المستخدم',
                          hintTextColor: AppColors.graylightColor,
                          textInputType: TextInputType.name)),
                  Container(
                      margin: EdgeInsets.only(
                          top: screenWidth(20),
                          left: screenWidth(30),
                          bottom: screenWidth(55)),
                      width: screenWidth(1.1),
                      height: screenWidth(6),
                      child: Custom_Text_Feild1(
                          controller: controller.TelgramUrlController,
                          hintText: 'رابط تلجرام الخاص بك',
                          hintTextColor: AppColors.graylightColor,
                          textInputType: TextInputType.url)),
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: screenWidth(2)),
                    child: ElevatedButton(
                      onPressed: () {
                        (controller.TelgramUrlController.text =
                            controller.BaseTelegramUrl +
                                controller.UserNamecontroller.text);
                      },
                      child: Text(
                        "توليد رابط تلجرام",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: screenWidth(24)),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.GreenLightApp,
                          fixedSize: Size(screenWidth(2.4), screenWidth(7.5)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  //TextButton(
                  //   onPressed: () {
                  //   launchUrl(urltelegram);
                  //},
                  //child: Text(controller.TelgramUrlController.text)),

                  InkWell(
                    onTap: () {
                      selectImages();
                      controller.isAddedImagesButon = true;
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: screenWidth(30),
                          top: screenWidth(6),
                          bottom: screenWidth(10)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            size: screenWidth(12),
                            color: AppColors.GreenLightApp,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: screenWidth(40)),
                            child: TextButton(
                              onPressed: () {
                                selectImages();
                                controller.isAddedImagesButon = true;
                                controller.isSelectedImages = true;
                              },
                              child: CustomText(
                                text: 'إضافة صور',
                                styleType: TextStyleType.CUSTOM,
                                fontSize: screenWidth(15),
                                fontWeight: FontWeight.bold,
                                textColor: AppColors.GreenApp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  controller.isAddedImagesButon
                      ? GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: controller.imageFileList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedImageIndex = index;
                                });
                              },
                              child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) => ImageDialoge(
                                              path: controller
                                                  .imageFileList[index].path));
                                    },
                                    child: Image.file(
                                      File(
                                          controller.imageFileList[index].path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.topEnd,
                                    child: IconButton(
                                      onPressed: () {
                                        DeleteSelectedImage();
                                      },
                                      icon: Icon(Icons.clear),
                                      color: AppColors.graylightColor,
                                      iconSize: screenWidth(11),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      : SizedBox(
                          height: screenWidth(50),
                        ),
                  controller.isSelectedImages
                      ? Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: screenWidth(4), bottom: screenWidth(10)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add_photo_alternate_outlined,
                                color: AppColors.GreenLightApp,
                              ),
                              TextButton(
                                  onPressed: () {
                                    selectImages();
                                  },
                                  child: CustomText(
                                    text: 'إضافة المزيد',
                                    styleType: TextStyleType.CUSTOM,
                                    fontSize: screenWidth(18),
                                    textColor: AppColors.GreenLightApp,
                                  )),
                            ],
                          ),
                        )
                      : SizedBox(),

                  Obx(() {
                    return controller.isLoading.value
                        ? SpinKitCircle(
                            color: AppColors.GreenLightApp,
                          )
                        : ElevatedButton(
                            onPressed: () {
                              // storage.setSelectedImages(controller.imageFileList);
                              controller.PostRequestApi();
                              controller.timestampe;
                            },
                            child: Text(
                              "نشر",
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: screenWidth(11)),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.GreenLightApp,
                                fixedSize:
                                    Size(screenWidth(1.7), screenWidth(6)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(
                                        color: AppColors.GreenApp,
                                        width: screenWidth(90)))),
                          );
                  }),
                  SizedBox(
                    height: screenWidth(10),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
