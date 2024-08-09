import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/all_posts_info.dart';
import 'package:empty_code/core/data/repositry/post_reposetory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicineController extends GetxController{

  TextEditingController textEditingController = TextEditingController();
    RxList<All_Posts_Info> allMedicinePosts = <All_Posts_Info>[].obs;
  RxList<All_Posts_Info> filtredMedicinePosts = <All_Posts_Info>[].obs;

  RxBool isLoadingData = true.obs;
  RxBool onRefresh = false.obs;


  
   @override
  void onInit() async {
    await GetAllMedicinePosts();

    // TODO: implement onInit
    super.onInit();
  }




  
    GetAllMedicinePosts() async {
    isLoadingData.value = true;
    await PostRepository().getAllMedicinePosts().then((value) {
      value.fold((l) {
        BotToast.showText(text: l);
      }, (r) {
        allMedicinePosts.clear();
        allMedicinePosts.addAll(r);
        filtredMedicinePosts.addAll(r);
      });
      isLoadingData.value = false;
    });
  }


    updateList(String query) {
    print(allMedicinePosts.length);
    filtredMedicinePosts.value = allMedicinePosts
        .where((p0) => p0.content!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}