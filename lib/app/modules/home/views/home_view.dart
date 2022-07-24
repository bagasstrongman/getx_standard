import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../components/my_widgets_animator.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (_) {
          return MyWidgetsAnimator(
            apiCallStatus: controller.apiCallStatus,
            loadingWidget: () => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: () => const Center(
              child: Text('Something went worng!'),
            ),
            successWidget: () => ListView.separated(
              itemCount: controller.data!.length,
              separatorBuilder: (_, __) => SizedBox(
                height: 10.h,
              ),
              itemBuilder: (ctx, index) => Row(
                children: [
                  SizedBox(
                    width: 300.w,
                    child: ListTile(
                      title: Text(controller.data![index]['title']),
                      subtitle: Text(controller.data![index]['category']),
                    ),
                  ),
                  SizedBox(
                    width: 60.w,
                    child: Image(
                      image: NetworkImage(controller.data![index]['image']),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
