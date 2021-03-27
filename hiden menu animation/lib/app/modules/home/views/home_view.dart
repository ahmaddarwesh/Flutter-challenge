import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller.animationController,
        builder: (BuildContext context, Widget child) {
          controller.slide =
              controller.maxSlide * controller.animationController.value;
          controller.scale = 1 - (controller.animationController.value * 0.1);
          return Stack(
            children: [
              buildMenu(),
              Transform(
                transform: Matrix4.identity()
                  ..translate(controller.slide)
                  ..scale(controller.scale),
                alignment: Alignment.centerRight,
                child: buildPage(),
              )
            ],
          );
        },
      ),
    );
  }

  Widget buildMenu() {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.deepPurple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Icon(
                      Icons.account_circle_outlined,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              menuItem("Dashboard", Icons.dashboard_outlined),
              menuItem("Topics", Icons.whatshot_outlined),
              menuItem("Articles", Icons.wysiwyg_sharp),
              menuItem("Profile", Icons.person_outline),
              menuItem("About", Icons.assignment_late_outlined),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget menuItem(text, icon) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: Text(
          text,
          style: GoogleFonts.aBeeZee(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        onTap: () {
          controller.changePage(text);
        },
      ),
    );
  }

  Widget buildPage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        controller.animationController.value * 40,
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: Text(
            controller.currentPage,
            style: GoogleFonts.aBeeZee(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              controller.animate();
            },
            child: Center(
              child: AnimatedIcon(
                size: 40,
                icon: AnimatedIcons.menu_close,
                progress: controller.animationController,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black54, blurRadius: 40),
            ],
          ),
        ),
      ),
    );
  }
}
