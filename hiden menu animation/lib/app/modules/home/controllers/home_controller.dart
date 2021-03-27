import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  var currentPage = "Dashboard";
  AnimationController animationController;
  var maxSlide = 200.0;
  double slide;
  double scale;

  animate() {
    animationController.isDismissed
        ? animationController.forward()
        : animationController.reverse();
    update();
  }

  changePage(page) {
    currentPage = page;
    animate();
    update();
  }

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
