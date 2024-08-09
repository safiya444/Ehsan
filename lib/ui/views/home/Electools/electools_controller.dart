import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/all_posts_info.dart';
import 'package:empty_code/core/data/repositry/post_reposetory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ElectoolsController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxList<All_Posts_Info> allElectoolsPosts = <All_Posts_Info>[].obs;
  RxList<All_Posts_Info> filtredElectoolsPosts = <All_Posts_Info>[].obs;

  RxBool isLoadingData = true.obs;
  RxBool onRefresh = false.obs;

  @override
  void onInit() {
    GetAllElectoolsPosts();
    // TODO: implement onInit
    super.onInit();
  }

  GetAllElectoolsPosts() async {
    isLoadingData.value = true;
    await PostRepository().getAllElectoolsPosts().then((value) {
      value.fold((l) {
        BotToast.showText(text: l);
      }, (r) {
        allElectoolsPosts.clear();
        allElectoolsPosts.addAll(r);
        filtredElectoolsPosts.addAll(r);
      });
      isLoadingData.value = false;
    });
  }

  updateList(String query) {
    print(allElectoolsPosts.length);
    filtredElectoolsPosts.value = allElectoolsPosts
        .where((p0) => p0.content!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
