import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/controllers/shared_pref_controller.dart';
import 'package:jdih_mobile_flutter/http_server.dart';

import 'package:jdih_mobile_flutter/views/kebijakan_privasi_page_static.dart';

class SplashScreenSimple extends StatefulWidget {
  SplashScreenSimple({super.key});

  final controller = Get.find<SharedPrefController>();

  @override
  State<SplashScreenSimple> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenSimple> {
  bool is1Visible = false;
  // bool is2Visible = false;
  // bool is3Visible = false;
  // bool is4Visible = false;
  // bool is5Visible = false;
  // bool is6Visible = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => setState(() {
        is1Visible = true;
      }),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Container(color: Color(0xFF045464))),
          SafeArea(
            child: Center(
              child: AnimatedOpacity(
                duration: Duration(seconds: 2),
                opacity: is1Visible ? 1 : 0,
                onEnd: () async {
                  Get.dialog(
                    AlertDialog(
                      content: Container(
                        height: 60,
                        width: 60,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      insetPadding: EdgeInsets.symmetric(horizontal: 100),
                    ),
                  );

                  await Get.find<HttpServer>().getApiUrl().then((value) {
                    widget.controller.isPrivacyAgreed.value
                        ? Get.offAllNamed('/')
                        : Get.offAll(() => KebijakanPrivasiPageStatic());
                  });
                },
                child: Center(child: Image.asset("assets/logo.png", scale: 4)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
