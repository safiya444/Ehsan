import 'package:empty_code/core/enums/bottom_navigation_bar.dart';
import 'package:empty_code/ui/views/home/home_view.dart';
import 'package:empty_code/ui/views/main/bottom_nvigation_bar.dart';
import 'package:empty_code/ui/views/main/side_menu.dart';
import 'package:empty_code/ui/views/post_request/post_request_view.dart';
import 'package:empty_code/ui/views/settings/settings_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController controller = PageController();
  BottomNavigationEnum select = BottomNavigationEnum.Home;
  GlobalKey<ScaffoldState> scafolldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scafolldKey,
      drawer: SideMenu(),
      bottomNavigationBar: CustomBottomNvigation(
          selectedView: select,
          onTap: (selectedView, index) {
            setState(() {
              select = selectedView;
            });

            controller.jumpToPage(index);
          }),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          HomeView(
            ontap: () {
              scafolldKey.currentState!.openDrawer();
            },
          ),
          PostRequestView(),
          SettingsView()
        ],
      ),
    ));
  }
}
