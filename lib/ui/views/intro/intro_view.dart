import 'package:dots_indicator/dots_indicator.dart';
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
    'مع تزايد عدد الأشخاص الذين يعانون من الحاجة والفقر في جميع أنحاء العالم، أصبح من الضروري البحث عن طرق جديدة وفعالة لتقديم المساعدة والتبرعات الإنسانية لهؤلاء الأشخاص. يهدف تطبيقنا إلى تسهيل عملية التبرع وتوزيع المساعدات بشكل شفاف وفعال، مما يساهم في تحسين جودة حياة المحتاجين وتلبية احتياجاتهم الأساسية. من خلال هذا التطبيق، نسعى إلى ببناء جسور التواصل بين المتبرعين والمستفيدين، وتشجيع ثقافة العطاء والتكافل الاجتماعي في المجتمع.',
    'You come into the world with nothing, and the purpose of your life is to make something out of nothing.',
    'مع تزايد عدد الأشخاص الذين يعانون من الحاجة والفقر في جميع أنحاء العالم، أصبح من الضروري البحث عن طرق جديدة وفعالة لتقديم المساعدة والتبرعات الإنسانية لهؤلاء الأشخاص. يهدف تطبيقنا إلى تسهيل عملية التبرع وتوزيع المساعدات بشكل شفاف وفعال، مما يساهم في تحسين جودة حياة المحتاجين وتلبية احتياجاتهم الأساسية. من خلال هذا التطبيق، نسعى إلى ببناء جسور التواصل بين المتبرعين والمستفيدين، وتشجيع ثقافة العطاء والتكافل الاجتماعي في المجتمع.'
  ];
  List<String> images = ['new-icon_ehsan', 'new-splash', 'index2'];

  int index = 2;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Text(
            descriptions[index],
            style: TextStyle(fontSize: screenWidth(25)),
          ),
          Image.asset('assets/images/pngs/${images[index]}.png'),
          DotsIndicator(
            dotsCount: images.length,
            position: index,
          ),
          InkWell(
            onTap: () {
              if (index > 0)
                setState(() {
                  index--;
                });
              else
                Get.off(Landing_View());
            },
            child: Text(
              index > 0 ? 'Next' : 'Finish',
              style: TextStyle(fontSize: 25),
            ),
          )
        ],
      ),
    ));
  }
}
