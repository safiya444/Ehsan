import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/all_posts_info.dart';
import 'package:empty_code/core/data/repositry/post_reposetory.dart';
import 'package:empty_code/core/data/repositry/post_request_repsitory.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/main/main_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostRequestController extends GetxController {
  TextEditingController UserNamecontroller = TextEditingController();
  TextEditingController TelgramUrlController = TextEditingController();
  TextEditingController ContentController = TextEditingController();
  TextEditingController siteController = TextEditingController();
  final DateTime timestampe = DateTime.now();


  var selecteditem;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  String BaseTelegramUrl = 'https://t.me/';
  bool isGenerateUrl = false;
  final ImagePicker imagePicker = ImagePicker();

  List<XFile> imageFileList = [];

  bool isSelectedImages = false;
  bool isAddedImagesButon = false;
  bool getimages = false;

  PostRequestController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  PostRequestApi() async {
    print('content: ${ContentController.text}');
    print('site: ${siteController.text}');
    print('username: ${UserNamecontroller.text}');
    print('linktelegram: ${TelgramUrlController.text}');
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      // تنفيذ الشيفرة إذا كانت البيانات صحيحة

      isLoading.value = true;
      await PostRequestRepository()
          .PostRequest(
        content: ContentController.text,
        site: siteController.text,
        type_Order: selecteditem,
        link_Telegram: TelgramUrlController.text,
        user_Telegram: UserNamecontroller.text,
      )
          .then((value) {
        storage.setSelectedImages(imageFileList);
        isLoading.value = false;
        print(value);
        value.fold((l) {
          BotToast.showText(
            text: l,
            duration: Duration(seconds: 3),
            contentPadding: EdgeInsets.all(15),
            textStyle: TextStyle(fontSize: 13.5, color: AppColors.whiteColor),
            contentColor: AppColors.GreenLightApp,
          );
        }, (r) {
          Get.offAll(MainView());
        });
      });
    }
  }
}
