import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/beforscreen.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_post.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';

import 'package:empty_code/ui/shared/custom_widget/custom_text_field_search.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/home/Electools/electools_view.dart';
import 'package:empty_code/ui/views/home/Medicine/medicine_post_view.dart';
import 'package:empty_code/ui/views/home/allposts.dart';
import 'package:empty_code/ui/views/home/cloths/clothes_post_view.dart';
import 'package:empty_code/ui/views/home/foodposts/food_post_view.dart';
import 'package:empty_code/ui/views/home/home_controller.dart';
import 'package:empty_code/ui/views/home/hometools/hometools_view.dart';
import 'package:empty_code/ui/views/home/money/money_view.dart';
import 'package:empty_code/ui/views/main/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  final Function? ontap;
  const HomeView({super.key, this.ontap});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());
  GlobalKey<ScaffoldState> scafolldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 7,
      child: Scaffold(
          key: scafolldKey,
          drawer: SideMenu(),
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(screenWidth(7)),
              child: Material(
                color: AppColors.whiteColor,
                child: TabBar(
                    isScrollable: true,
                    labelStyle: TextStyle(
                        fontSize: screenWidth(20), color: AppColors.blackColor),
                    labelColor: AppColors.GreenLightApp,
                    dividerColor: AppColors.GreenLightApp,
                    indicatorColor: AppColors.GreenLightApp,
                    tabs: [
                      Tab(
                        text: 'الكل',
                      ),
                      Tab(
                        text: 'ألبسة',
                      ),
                      Tab(
                        text: 'مواد غذائية',
                      ),
                      Tab(
                        text: 'أدوية',
                      ),
                      Tab(
                        text: 'أدوات كهربائية',
                      ),
                      Tab(
                        text: 'أدوات منزلية',
                      ),
                      Tab(
                        text: 'مبلغ مالي',
                      ),
                    ]),
              ),
            ),
            toolbarHeight: screenWidth(7),
            title: CustomText(
              text: 'الرئيسة',
              styleType: TextStyleType.NAME,
              textColor: AppColors.GreenApp,
            ),
            centerTitle: true,
            backgroundColor: AppColors.GreenLightApp,
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.only(end: screenWidth(27)),
                child: Image.asset(
                  'assets/images/pngs/new-icon_ehsan.png',
                  width: screenWidth(12),
                ),
              )
            ],
            leading: IconButton(
                onPressed: () {
                  scafolldKey.currentState!.openDrawer();
                },
                icon: Icon(
                  Icons.density_medium_outlined,
                  size: screenWidth(15),
                  color: AppColors.GreenApp,
                )),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
              child: AllPostView(),
            ),
            SingleChildScrollView(
              child: ClothesView(),
            ),
            SingleChildScrollView(
              child: FoodPostView(),
            ),
            SingleChildScrollView(
              child: MedicineView(),
            ),
            SingleChildScrollView(
              child: ElectoolsView(),
            ),
            SingleChildScrollView(
              child: HometoolsView(),
            ),
            SingleChildScrollView(
              child: MoneyView(),
            ),
          ])),
    ));
  }
}
