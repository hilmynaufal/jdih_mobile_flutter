import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdih_mobile_flutter/controllers/shared_pref_controller.dart';
import 'package:jdih_mobile_flutter/http_server.dart';

import 'package:jdih_mobile_flutter/views/kebijakan_privasi_page_static.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  final controller = Get.find<SharedPrefController>();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool is1Visible = false;
  bool is2Visible = false;
  bool is3Visible = false;
  bool is4Visible = false;
  bool is5Visible = false;
  bool is6Visible = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => setState(() {
        is1Visible = true;
        Future.delayed(
          Duration(milliseconds: 100),
          () => setState(() {
            is2Visible = true;
            Future.delayed(
              Duration(milliseconds: 300),
              () => setState(() {
                is3Visible = true;
                Future.delayed(
                  Duration(milliseconds: 500),
                  () => setState(() {
                    is4Visible = true;
                    Future.delayed(
                      Duration(milliseconds: 700),
                      () => setState(() {
                        is5Visible = true;
                        Future.delayed(
                          Duration(milliseconds: 900),
                          () => setState(() {
                            is6Visible = true;
                          }),
                        );
                      }),
                    );
                  }),
                );
              }),
            );
          }),
        );
      }),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/bg.jpg", fit: BoxFit.cover),
          ),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 32),
                  AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: is6Visible ? 1 : 0,
                    child: Image.asset("assets/6.png", scale: 8),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Center(
                              child: AnimatedOpacity(
                                duration: Duration(seconds: 1),
                                opacity: is5Visible ? 1 : 0,
                                onEnd: () {
                                  setState(() {
                                    is6Visible = true;
                                  });
                                },
                                child: Image.asset("assets/5.png", scale: 3.6),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AnimatedOpacity(
                                      duration: Duration(seconds: 1),
                                      opacity: is1Visible ? 1 : 0,
                                      onEnd: () {
                                        setState(() {
                                          is2Visible = true;
                                        });
                                      },
                                      child: Image.asset(
                                        "assets/1.png",
                                        scale: 12,
                                      ),
                                    ),
                                    AnimatedOpacity(
                                      duration: Duration(seconds: 1),
                                      opacity: is2Visible ? 1 : 0,
                                      onEnd: () {
                                        setState(() {
                                          is3Visible = true;
                                        });
                                      },
                                      child: Image.asset(
                                        "assets/2.png",
                                        scale: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                AnimatedOpacity(
                                  duration: Duration(seconds: 1),
                                  opacity: is3Visible ? 1 : 0,
                                  onEnd: () {
                                    setState(() {
                                      is4Visible = true;
                                    });
                                  },
                                  child: Image.asset("assets/3.png", scale: 11),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      AnimatedOpacity(
                        duration: Duration(seconds: 1),
                        opacity: is4Visible ? 1 : 0,
                        onEnd: () {
                          setState(() {
                            is5Visible = true;
                          });
                        },
                        child: Image.asset("assets/4.png", scale: 6),
                      ),
                    ],
                  ),
                  Spacer(),
                  AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: is6Visible ? 1 : 0,
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
                    child: Image.asset("assets/6-1.png", scale: 8),
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
