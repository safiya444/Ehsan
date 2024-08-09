import 'package:dartz/dartz.dart';
import 'package:empty_code/core/data/models/all_posts_info.dart';
import 'package:empty_code/core/data/models/common_response.dart';
import 'package:empty_code/core/enums/request_type.dart';
import 'package:empty_code/core/utils/network_util.dart';

class PostRepository{



  Future<Either<String, List<All_Posts_Info>>> getAllPost() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/posts',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<All_Posts_Info> listinfoPost = [];
          commonResponse.data!.forEach((element) {
            listinfoPost.add(All_Posts_Info.fromJson(element));
          });
          return Right(listinfoPost);

          // return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }





  Future<Either<String, List<All_Posts_Info>>> getAllFoodPosts() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/posts/Food',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<All_Posts_Info> listinfoPost = [];
          commonResponse.data!.forEach((element) {
            listinfoPost.add(All_Posts_Info.fromJson(element));
          });
          return Right(listinfoPost);

          // return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }










  Future<Either<String, List<All_Posts_Info>>> getAllClothesPosts() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/posts/Clothes',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<All_Posts_Info> listinfoPost = [];
          commonResponse.data!.forEach((element) {
            listinfoPost.add(All_Posts_Info.fromJson(element));
          });
          return Right(listinfoPost);

          // return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }









  Future<Either<String, List<All_Posts_Info>>> getAllMedicinePosts() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/posts/Medicine',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<All_Posts_Info> listinfoPost = [];
          commonResponse.data!.forEach((element) {
            listinfoPost.add(All_Posts_Info.fromJson(element));
          });
          return Right(listinfoPost);

          // return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }




  
  Future<Either<String, List<All_Posts_Info>>> getAllElectoolsPosts() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/posts/Electools',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<All_Posts_Info> listinfoPost = [];
          commonResponse.data!.forEach((element) {
            listinfoPost.add(All_Posts_Info.fromJson(element));
          });
          return Right(listinfoPost);

          // return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }





  
  Future<Either<String, List<All_Posts_Info>>> getAllHometoolsPosts() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/posts/Hometools',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<All_Posts_Info> listinfoPost = [];
          commonResponse.data!.forEach((element) {
            listinfoPost.add(All_Posts_Info.fromJson(element));
          });
          return Right(listinfoPost);

          // return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }






  Future<Either<String, List<All_Posts_Info>>> getAllMoneyPosts() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/posts/Money',
      ).then((value) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          List<All_Posts_Info> listinfoPost = [];
          commonResponse.data!.forEach((element) {
            listinfoPost.add(All_Posts_Info.fromJson(element));
          });
          return Right(listinfoPost);

          // return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

}