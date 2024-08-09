import 'dart:io';

import 'package:empty_code/ui/shared/custom_widget/image_dialoge.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/post_request/post_request_controlle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagesView extends StatefulWidget {
  const ImagesView({super.key});

  @override
  State<ImagesView> createState() => _ImagesViewState();
}

class _ImagesViewState extends State<ImagesView> {
  PostRequestController controller = Get.put(PostRequestController());
  int selectedImageIndex = 0;

  List<XFile> _selectedImages = [];

  @override
  void initState() {
    super.initState();
    _loadSelectedImages();
  }

  Future<void> _loadSelectedImages() async {
    _selectedImages.clear();
    List<String> selectedImages =
        (await storage.getSelectedImages()).cast<String>();
    setState(() {
      _selectedImages = selectedImages.cast<XFile>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: _selectedImages.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedImageIndex = index;
                });
              },
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) =>
                              ImageDialoge(path: _selectedImages[index].path));
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: screenWidth(10),
                      ),
                      child: Image.file(
                        File(_selectedImages[index].path),
                        fit: BoxFit.cover,
                       
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
