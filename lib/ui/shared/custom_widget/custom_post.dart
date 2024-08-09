import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/images/images_view.dart';
import 'package:empty_code/ui/views/post_request/post_request_controlle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomPost extends StatefulWidget {
  final String requesttype;
  final String content;
  final String address;
  final String linkTelegram;
  final String formtedate;

  const CustomPost({
    super.key,
    required this.requesttype,
    required this.content,
    required this.address,
    required this.linkTelegram,
    required this.formtedate,
  });

  @override
  State<CustomPost> createState() => _CustomPostState();
}

class _CustomPostState extends State<CustomPost> {
  PostRequestController controller = Get.put(PostRequestController());
  @override
  Widget build(BuildContext context) {
    final Uri urltelegram = Uri.parse(widget.linkTelegram);

    return Container(
      width: screenWidth(1.1),
      height: screenWidth(1.5),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blackColor),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
              color: AppColors.graylightColor,
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(1, 6))
        ],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: screenWidth(18)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'تم النشر في ',
                  style: TextStyle(
                      fontSize: screenWidth(29),
                      color: Color.fromARGB(255, 108, 108, 108)),
                ),
                Text(widget.formtedate,
                    style: TextStyle(
                        fontSize: screenWidth(34),
                        color: Color.fromARGB(255, 108, 108, 108)))
              ],
            ),
            Text(
              widget.requesttype,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.content,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  "العنوان:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.address,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "رابط تلغرام للتواصل: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(urltelegram);
                  },
                  child: Text(
                    widget.linkTelegram,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 53, 117, 245)),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Get.to(ImagesView());
              },
              child: Text(
                'لمشاهدة الصور اضغط هنا...',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.GreenLightApp,
                    fontSize: screenWidth(24)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
