import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/all_posts_info.dart';
import 'package:empty_code/core/data/repositry/post_reposetory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoneyController extends GetxController{



     TextEditingController textEditingController = TextEditingController();
    RxList<All_Posts_Info> allMoneyPosts = <All_Posts_Info>[].obs;
  RxList<All_Posts_Info> filtredMoneyPosts = <All_Posts_Info>[].obs;

  RxBool isLoadingData = true.obs;
  RxBool onRefresh = false.obs;


  
   @override
  void onInit() async {
    await GetAllMoneyPosts();

    // TODO: implement onInit
    super.onInit();
  }


    GetAllMoneyPosts() async {
    isLoadingData.value = true;
    await PostRepository().getAllMoneyPosts().then((value) {
      value.fold((l) {
        BotToast.showText(text: l);
      }, (r) {
        allMoneyPosts.clear();
        allMoneyPosts.addAll(r);
        filtredMoneyPosts.addAll(r);
      });
      isLoadingData.value = false;
    });
  }

    
  updateList(String query) {
    print(allMoneyPosts.length);
    filtredMoneyPosts.value = allMoneyPosts
        .where((p0) => p0.content!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}