import 'package:empty_code/ui/shared/utils.dart';
import 'package:get/get.dart';

class ImagesContrller extends GetxController {
  RxBool getimages = storage.getSelectedImages() as RxBool;
}
