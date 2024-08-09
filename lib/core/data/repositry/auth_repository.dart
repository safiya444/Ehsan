

import 'package:dartz/dartz.dart';
import 'package:empty_code/core/data/models/common_response.dart';
import 'package:empty_code/core/data/models/login_and_regester_info.dart';
import 'package:empty_code/core/enums/request_type.dart';
import 'package:empty_code/core/utils/network_util.dart';

class AuthRepository {
  Future<Either<String, LoginAndRegister_Info>> login({
    required String email,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'api/auth/login',
        headers:{
          'Content-Type':'application/json;charset=UTF-8'
        },
        body:{
           "email": email,
          "password": password,
        },
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(LoginAndRegister_Info.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }





    Future<Either<String, LoginAndRegister_Info>> Register({
    required String email,
    required String password,
     required String username,
      required String phone,
       required String confirmPassword,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'api/auth/register',
        headers:{
          'Content-Type':'application/json;charset=UTF-8'
        },
        body:{
           "email": email,
          "password": password,
          "username":username,
          "phone":phone,
          "confirmPassword":confirmPassword
        },
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(LoginAndRegister_Info.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }















}