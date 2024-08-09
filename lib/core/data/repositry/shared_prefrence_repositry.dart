import 'dart:convert';

import 'package:empty_code/core/data/models/login_and_regester_info.dart';
import 'package:empty_code/core/enums/data_type.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class SharedPrefrenceRepository {
  SharedPreferences pref = Get.find<SharedPreferences>();

  //!---- Keys  ------

  String PREF_FIRST_LUNCH = 'first_lunch';
  String PREF_IS_LOGGED = 'logged_in';
  String PREF_LOGIN_INFO = 'login_info';
  String PREF_TOKEN_INFO = 'token_info';
  String PREF_APP_LANG = 'app_language';
  String PREF_CART_LIST = 'cart_list';
  String PREF_SELECTED_IMAGES = 'selected_images';
 

  void setSelectedImages(List<XFile> images) {
    List<String> imagePaths = images.map((image) => image.path).toList();
    setPrefrenc(
        type: DataType.LISTSTRING,
        key: PREF_SELECTED_IMAGES,
        value: imagePaths);
  }

  List<XFile> getSelectedImages() {
    if (pref.containsKey(PREF_SELECTED_IMAGES)) {
      List<String>? imagePaths = pref.getStringList(PREF_SELECTED_IMAGES);

      List<XFile> images =
          imagePaths?.map((path) => XFile(path)).toList() ?? [];
      return images;
    } else {
      return [];
    }
  }






   








  
   









  void setLoggedIn(bool value) {
    setPrefrenc(type: DataType.BOOL, key: PREF_IS_LOGGED, value: value);
  }

  bool getLoggedIn() {
    if (pref.containsKey(PREF_IS_LOGGED))
      return getPrefrence(PREF_IS_LOGGED);
    else
      return false;
  }

  void setFirstLunch(bool value) {
    setPrefrenc(type: DataType.BOOL, key: PREF_FIRST_LUNCH, value: value);
  }

  bool getFirstLunch() {
    if (pref.containsKey(PREF_FIRST_LUNCH))
      return getPrefrence(PREF_FIRST_LUNCH);
    else
      return true;
  }

  // List<String> getLoginInfo() {
  //   if (pref.containsKey(PREF_LOGIN_INFO))
  //   return RememberMe.fromJson(jsonDecode(getPrefrence(PREF_LOGIN_INFO)));
  //   else
  //    return RememberMe(username: '', password: '', rememberme: false);

  // }

  // void setLoginInfo(RememberMe value) {
  //   setPrefrenc(
  //       type: DataType.STRING,
  //       key: PREF_LOGIN_INFO,
  //       value: jsonEncode(value.toJson()));
  // }

  void setTokenInfo(LoginAndRegister_Info token) {
     setPrefrenc(
        type: DataType.STRING,
        key: PREF_TOKEN_INFO,
        value: jsonEncode(token.toJson()));
   }

   LoginAndRegister_Info getTokenInfo() {
     return LoginAndRegister_Info.fromJson(jsonDecode(getPrefrence(PREF_TOKEN_INFO)));
   }


void deleteToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(PREF_TOKEN_INFO);
}

  void setAppLanguage(String code) {
    setPrefrenc(type: DataType.STRING, key: PREF_APP_LANG, value: code);
  }

  String getAppLanguage() {
    if (pref.containsKey(PREF_APP_LANG)) {
      return getPrefrence(PREF_APP_LANG);
    } else {
      return 'ar';
    }
  }
  // void setCartList(List<CartModel> list) {
  //   setPrefrenc(
  //       type: DataType.STRING,
  //       key: PREF_CART_LIST,
  //       value: CartModel.encode(list));
  // }

  // List<CartModel> getCartList() {
  //   if (pref.containsKey(PREF_CART_LIST))

  //     return CartModel.decode(getPrefrence(PREF_CART_LIST));
  //   else
  //     return [];
  // }

  //*====================================

  void setPrefrenc({
    required DataType type,
    required String key,
    required dynamic value,
  }) async {
    switch (type) {
      case DataType.INT:
        await pref.setInt(key, value);
        break;
      case DataType.STRING:
        await pref.setString(key, value);
        break;
      case DataType.BOOL:
        await pref.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await pref.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await pref.setStringList(key, value);
        break;
    }
  }

  dynamic getPrefrence(String key) {
    return pref.get(key);
  }
}
