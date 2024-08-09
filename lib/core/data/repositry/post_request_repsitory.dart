import 'package:dartz/dartz.dart';
import 'package:empty_code/core/data/models/common_response.dart';
import 'package:empty_code/core/data/models/post_request_info.dart';
import 'package:empty_code/core/enums/request_type.dart';
import 'package:empty_code/core/utils/network_util.dart';

class PostRequestRepository {
  Future<Either<String, PostRequestInfo>> PostRequest({
    required String type_Order,
    required String content,
    required String site,
    required String user_Telegram,
    required String link_Telegram,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'api/posts',
        headers: {'Content-Type': 'application/json;charset=UTF-8'},
        body: {
          "type_Order": type_Order,
          "content": content,
          'site': site,
          "user_Telegram": user_Telegram,
          "link_Telegram": link_Telegram,
        },
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(PostRequestInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
