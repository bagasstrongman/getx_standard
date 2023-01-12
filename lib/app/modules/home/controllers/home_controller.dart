import 'package:get/get.dart';
import 'package:getx_standard/app/service/api_urls.dart';
import 'package:getx_standard/app/service/base_controller.dart';

import '../../../service/dio_client.dart';
import '../../model/Posts.dart';

class HomeController extends GetxController with BaseController {
  ///POST LIST
  final postList = RxList<Posts>();

  getPostList() async {
    showLoading('Loading post');

    var response = await DioClient().get(ApiUrl.allPosts, {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    }).catchError(handleError);

    if (response == null) return;

    postList
        .assignAll((response as List).map((e) => Posts.fromJson(e)).toList());

    hideLoading();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    await getPostList();
    super.onReady();
  }
}
