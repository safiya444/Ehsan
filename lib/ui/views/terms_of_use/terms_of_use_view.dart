import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsOfUseView extends StatefulWidget {
  const TermsOfUseView({super.key});

  @override
  State<TermsOfUseView> createState() => _TermsOfUseViewState();
}

class _TermsOfUseViewState extends State<TermsOfUseView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: screenWidth(6),
        title: CustomText(
          text: 'شروط الاستخدام',
          styleType: TextStyleType.NAME,
          textColor: AppColors.GreenApp,
        ),
        centerTitle: true,
        backgroundColor: AppColors.GreenLightApp,
        leading: IconButton(
            onPressed: () {
              Get.to(SettingsView());
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: screenWidth(15),
              color: AppColors.GreenApp,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                  end: screenWidth(6), top: screenWidth(30)),
              child: CustomText(
                text: 'شروط الاستخدام لتطبيق إحسان:',
                textColor: AppColors.GreenLightApp,
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(17),
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: screenWidth(75),
                start: screenWidth(30),
              ),
              child: CustomText(
                text:
                    'يرجى قراءة هذه الأحكام والروط بعناية قبل استخدام هذا التطبيق . باستخامك للتطبيق ، فإنك توافق على هذه الشروط وتلتزم بها بشكل كامل . اذا كنت غير موافق على هذه الشروط يرجى عدم استخام التطبيق.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), end: screenWidth(1.9)),
              child: CustomText(
                text: '1.الاستخدام الشخصي:',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(23),
                textColor: AppColors.GreenLightApp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: screenWidth(30)),
              child: CustomText(
                text:
                    'يجب استخدام تطبيق إحسان للاغراض الشخصية فقط . لايجوز استخدام التطبيق لأي اغراض غير قانونية او غير أخلاقية.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), end: screenWidth(1.4)),
              child: CustomText(
                text: '2.المحتوى:',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(20),
                textColor: AppColors.GreenLightApp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: screenWidth(30)),
              child: CustomText(
                text:
                    'تحتفظ إحسان بجميع حقوق الملكية الفكرية المتعلقة بالتطبيق ومحتواه. بما في ذلك النصوص والصولر والرسومات والشعارات والايقونات والبرامج وغيرها من المواد. لايجوز نسخ او توزيع او نقل او تعديل او إعادة نشر او استخدام اي جزء من المحتوى بدون اذن مسبق من إحسان.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), end: screenWidth(1.75)),
              child: CustomText(
                text: '3.معلومات المستخدم:',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(25),
                textColor: AppColors.GreenLightApp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: screenWidth(30)),
              child: CustomText(
                text:
                    'عند استخدام التطبيق قد يطلب منك تقديم بعض المعلومات الشخصية . يجب على المستخدم تقديم معلومات صحيحة وتحديثها عند الحاجة . إحسان لديه الحق في حظر او إنهاء حساب المستخدم اذا تبين ان المعلومات المقدمة غير صحيحة او مضللة.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), end: screenWidth(1.65)),
              child: CustomText(
                text: '4.السلوك المناسب:',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(23.8),
                textColor: AppColors.GreenLightApp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: screenWidth(30)),
              child: CustomText(
                text:
                    'يجب على المستخدمين التصرفبطريقة لائقة اثناء استخدام التطبيق والتفاعل مع المستخدمين الآخرين . لايجوز نشر او توزيع محتوى مسيء او مخل بالآداب او ينتهك حقوق الآخرين.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), end: screenWidth(1.5)),
              child: CustomText(
                text: '5.التعويض:',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(20),
                textColor: AppColors.GreenLightApp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: screenWidth(30)),
              child: CustomText(
                text:
                    'يوافق المستخدم على تعويض إحسان وحماية تطبيق إحسان والموظفين والشركاء والمساهمين ضد اي مطالبات او خسائر او أضرار تنشأ عند استخدامه للتطبيق او انتهاكه لهذه الشروط.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), end: screenWidth(1.75)),
              child: CustomText(
                text: '6.التغييرات والإنهاء:',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(23.3),
                textColor: AppColors.GreenLightApp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: screenWidth(30)),
              child: CustomText(
                text:
                    'يحتفظ إحسان بالحق في تعديل او تحديث هذه الشروط والاحكام من وقت لآخر . قد يتم إشعار المستخدمين بالتغييرات المهمة عن طريق الإشعار داخل التطبيق او تعليقه في اي وقت و بدون سابق انذار.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), end: screenWidth(1.95)),
              child: CustomText(
                text: '7.التحديثات والتوافق:',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(21.6),
                textColor: AppColors.GreenLightApp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: screenWidth(30)),
              child: CustomText(
                text:
                    'قد يتطلب استخدام تطبيق إحسان تحديثات من وقت لآخر .يجب على المستخدمين تنزيل وتثبيت التحديثات اللازمة لضمان التوافق والآداء السليم للتطبيق.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), end: screenWidth(1.7)),
              child: CustomText(
                text: '8.إلغاء الضمان:',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(20),
                textColor: AppColors.GreenLightApp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: screenWidth(30)),
              child: CustomText(
                text:
                    'يتم تقديم تطبيق إحسان كما هو وحسب التوفر دون اي ضمانات صريحة او ضمنية . لايتحمل إحسان اي مسؤولية عن اي اضرار مباشرة او غير مباشرة تنشأ عند استخدام التطبيق.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), end: screenWidth(1.8)),
              child: CustomText(
                text: '9.القانون الساري:',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(20),
                textColor: AppColors.GreenLightApp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: screenWidth(30)),
              child: CustomText(
                text:
                    'تخضع هذه الشروط والأحكام للقوانين السارية في الدولة التي يتم تشغيل التطبيق فيها.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), end: screenWidth(1.95)),
              child: CustomText(
                text: '10.التسوية القضائية:',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(21),
                textColor: AppColors.GreenLightApp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: screenWidth(30)),
              child: CustomText(
                text:
                    'في حال وجود اي نزاع ينشأ عن استخدام التطبيق ، يجب حل النزاع بشكل سلمي و ودي بين الأطراف . اذا لم يتم التوصل الى تسوية ، يتعين تقديم النزاع الى القضاء المختص في الدولة ذات الاختصاص القضائي.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  start: screenWidth(30), top: screenWidth(10)),
              child: CustomText(
                text:
                    'من خلال استخدامك لتطبيق إحسان . فإنك توافق على هذه الروط والأحكام بالكامل وتلتزم بها. يرجى قراءة الشروط بعناية والتأكد من فهمها قبل استخام التطبيق. اذا كان لديك اي اسئلة او استفسارات ، يرجى الاتصال بفريق دعم إحسان.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
