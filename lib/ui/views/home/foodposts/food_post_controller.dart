import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/all_posts_info.dart';
import 'package:empty_code/core/data/repositry/post_reposetory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPostController extends GetxController{
    TextEditingController textEditingController = TextEditingController();
    RxList<All_Posts_Info> allFodPosts = <All_Posts_Info>[].obs;
  RxList<All_Posts_Info> filtredFoodPosts = <All_Posts_Info>[].obs;

  RxBool isLoadingData = true.obs;
  RxBool onRefresh = false.obs;


   @override
  void onInit() async {
    await GetAllFoodPosts();

    // TODO: implement onInit
    super.onInit();
  }



    GetAllFoodPosts() async {
    isLoadingData.value = true;
    await PostRepository().getAllFoodPosts().then((value) {
      value.fold((l) {
        BotToast.showText(text: l);
      }, (r) {
        allFodPosts.clear();
        allFodPosts.addAll(r);
        filtredFoodPosts.addAll(r);
      });
      isLoadingData.value = false;
    });
  }




  
  updateList(String query) {
    print(allFodPosts.length);
    filtredFoodPosts.value = allFodPosts
        .where((p0) => p0.content!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}