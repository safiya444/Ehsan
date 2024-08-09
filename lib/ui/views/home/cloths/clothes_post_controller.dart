import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/all_posts_info.dart';
import 'package:empty_code/core/data/repositry/post_reposetory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClothesController extends GetxController{

   TextEditingController textEditingController = TextEditingController();
    RxList<All_Posts_Info> allClothesPosts = <All_Posts_Info>[].obs;
  RxList<All_Posts_Info> filtredClothesPosts = <All_Posts_Info>[].obs;

  RxBool isLoadingData = true.obs;
  RxBool onRefresh = false.obs;


  
   @override
  void onInit() async {
    await GetAllClothesPosts();

    // TODO: implement onInit
    super.onInit();
  }


    GetAllClothesPosts() async {
    isLoadingData.value = true;
    await PostRepository().getAllClothesPosts().then((value) {
      value.fold((l) {
        BotToast.showText(text: l);
      }, (r) {
        allClothesPosts.clear();
        allClothesPosts.addAll(r);
        filtredClothesPosts.addAll(r);
      });
      isLoadingData.value = false;
    });
  }

    
  updateList(String query) {
    print(allClothesPosts.length);
    filtredClothesPosts.value = allClothesPosts
        .where((p0) => p0.content!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

}