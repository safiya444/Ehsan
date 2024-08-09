import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/all_posts_info.dart';
import 'package:empty_code/core/data/repositry/post_reposetory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HometoolsController extends GetxController{

  
   TextEditingController textEditingController = TextEditingController();
    RxList<All_Posts_Info> allHometoolsPosts = <All_Posts_Info>[].obs;
  RxList<All_Posts_Info> filtredHometoolsPosts = <All_Posts_Info>[].obs;

  RxBool isLoadingData = true.obs;
  RxBool onRefresh = false.obs;


  
   @override
  void onInit() async {
    await GetAllHometoolsPosts();

    // TODO: implement onInit
    super.onInit();
  }


    GetAllHometoolsPosts() async {
    isLoadingData.value = true;
    await PostRepository().getAllHometoolsPosts().then((value) {
      value.fold((l) {
        BotToast.showText(text: l);
      }, (r) {
        allHometoolsPosts.clear();
        allHometoolsPosts.addAll(r);
        filtredHometoolsPosts.addAll(r);
      });
      isLoadingData.value = false;
    });
  }

    
  updateList(String query) {
    print(allHometoolsPosts.length);
    filtredHometoolsPosts.value = allHometoolsPosts
        .where((p0) => p0.content!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}