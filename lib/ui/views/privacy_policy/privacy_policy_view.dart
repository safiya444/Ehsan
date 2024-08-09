import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: screenWidth(6),
        title: CustomText(
          text: 'سياسة الخصوصية',
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
                top: screenWidth(25),
                start: screenWidth(30),
              ),
              child: CustomText(
                text:
                    'نحن في فريق تطبيق إحسان ملتزمون بحماية خصوصية المستخدمين لدينا ، ونهدف الى ضمان ان تكون معلوماتك الشخصية آمنة و محمية. توضح سياسة الخصوصية هذه كيفية معنا واستخدامنا للمعلومات الشخصية التي تقدموها لنا عند استخدامكم لتطبيق إحسان.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), end: screenWidth(1.7)),
              child: CustomText(
                text: '1.جمع المعلومات:',
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
                    'عند تسجيلك في تطبيق إحسان ، فإننا قد نقوم بجمع بعض المعلومات التي تقدمها طوعاً،مثل الاسم و معلومات الاتصال.قد نقوم ايضاً بجمع معلومات تقنية عن جهازك ونظام التشغيل الذي تستخدمه للوصول الى التطبيق.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), end: screenWidth(1.9)),
              child: CustomText(
                text: '2.استخدام المعلومات:',
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
                    'نحن نستخدم المعلومات التي نجمعها لتقديم خدماتنا وتحسينها. يمكن ان نستخدم المعلومات للتواصل معك وتزويدك بالمساعدة والدعم اللازميين. قد نستخدم المعلومات أيضاً لتحليل استخدام التطبيق وتحسينه وتخصيص تجربتك.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), end: screenWidth(1.9)),
              child: CustomText(
                text: '3.مشاركة المعلومات:',
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
                    'نحن نحترم خصوصية معلوماتك الشخصية ولا نشاركها مع طرف ثالث دون موافقتك،إلَا في الحالات التالية:                                -عندما تعطينا اذناً صريحاً للمشاركة.     -عندما نكون ملزمين بمشاركة المعلومات وفقاً للقوانين.                                           - عندما نحتاج الى مشاركة المعلومات مع مقدميًِ الخدمات اللذين يساعدوننا في تشغيل وتحسين التطبيق.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), end: screenWidth(1.8)),
              child: CustomText(
                text: '4.أمان المعلومات:',
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
                    'نحن نتخذ إجراءات أمنية ملائمة لحماية معلوماتك الشخصية من الوصول الغير مصرح به او الاستخدام او التغيير او الكشف.نحن نستخدم تقنيات أمان متقدمة لحماية بياناتك.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), end: screenWidth(1.9)),
              child: CustomText(
                text: '5.تحديثات السياسة:',
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
                    'قد نقوم بتحديث سياسة الخصوصية هذه من حين لآخر. سنقوم باشعارك بأي تغييرات مهمة عن طريق اشعار داخل التطبيق او عن طريق وسائل أخرى.يرجى مراجعة سياسة الخصوصية بانتظام للحصول على معلومات حول كيفية حماية خصوصيتك.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: screenWidth(15), end: screenWidth(1.55)),
              child: CustomText(
                text: '6.الاتصال بنا:',
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
                    'اذا كان لديك أي اسئلة او استفسارات حول سياسة الخصوصية او ممارساتنا فيما يتعلق بالمعلومات الشخصية، يرجى الاتصال بنا عبر وسائل الاتصال المتاحة في تطبيق إحسان.',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(18),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  start: screenWidth(30),
                  top: screenWidth(15),
                  bottom: screenWidth(15)),
              child: CustomText(
                text:
                    'نحن نقدر ثقتك بنا ونعمل بجد لحماية خصوصية معلوماتك الشخصية. يرجى قراءة سياسة الخصوصية هذه بعناية وفهم كيفية جمع واستخدام وحماية معلوماتك.في الاستمرار باستخدام تطبيق إحسان ، فإنك توافق على سياسة الخصوصية هذه وعلى جمع واستخدام المعلومات الواردة فيها.',
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
