import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/all_posts_info.dart';
import 'package:empty_code/core/data/repositry/post_reposetory.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_post.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxList<All_Posts_Info> allPosts = <All_Posts_Info>[].obs;
  RxList<All_Posts_Info> filtredPosts = <All_Posts_Info>[].obs;
  RxBool isLoadingData = true.obs;
  RxBool onRefresh = false.obs;

  @override
  void onInit() async {
    await GetAllPosts();

    // TODO: implement onInit
    super.onInit();
  }

 

  GetAllPosts() async {
    isLoadingData.value = true;
    await PostRepository().getAllPost().then((value) {
      value.fold((l) {
        BotToast.showText(text: l);
      }, (r) {
        allPosts.clear();
        allPosts.addAll(r);
        filtredPosts.addAll(r);
      });
      isLoadingData.value = false;
    });
  }

  updateList(String query) {
    print(allPosts.length);
    filtredPosts.value = allPosts
        .where((p0) => p0.content!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
