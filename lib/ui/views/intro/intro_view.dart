import 'package:dots_indicator/dots_indicator.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/landing/landing_view.dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  List<String> descriptions = [
    'تم توفير طريقة تواصل آمنة بين المتبرع والمحتاج وهي من خلال اضافة رابط الملف الشخصي للمتبرع في تلجرام',
    'تستطيع من خلال هذا التطبيق أن تتبرع بجميع أنواع التبرعات لديك من خلال اضافة منشور تشرح فيه عن الشيء المتبرع به',
    'مع تزايد عدد الأشخاص الذين يعانون من الحاجة والفقر في جميع أنحاء العالم، أصبح من الضروري البحث عن طرق جديدة وفعالة لتقديم المساعدة والتبرعات الإنسانية لهؤلاء الأشخاص. يهدف تطبيقنا إلى تسهيل عملية التبرع وتوزيع المساعدات بشكل شفاف وفعال، مما يساهم في تحسين جودة حياة المحتاجين وتلبية احتياجاتهم الأساسية. من خلال هذا التطبيق، نسعى إلى ببناء جسور التواصل بين المتبرعين والمستفيدين، وتشجيع ثقافة العطاء والتكافل الاجتماعي في المجتمع.',
  ];
  List<String> images = ['index0', 'index1', 'index2'];

  int index = 2;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: screenWidth(4),
                start: screenWidth(23),
                end: screenWidth(23)),
            child: Text(
              descriptions[index],
              style: TextStyle(
                  fontSize: screenWidth(23), fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset(
            'assets/images/pngs/${images[index]}.png',
            width: screenWidth(1.5),
          ),
          DotsIndicator(
            dotsCount: images.length,
            position: index,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                end: screenWidth(2), top: screenWidth(10)),
            child: InkWell(
              onTap: () {
                if (index > 0)
                  setState(() {
                    index--;
                  });
                else
                  Get.off(Landing_View());
              },
              child: Text(
                index > 0 ? 'التالي' : 'الدخول إلى التطبيق',
                style: TextStyle(
                    fontSize: screenWidth(17),
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
