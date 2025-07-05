import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:jdih_mobile_flutter/controllers/daftar_controller.dart';
import 'package:jdih_mobile_flutter/controllers/login_controller.dart';
import 'package:jdih_mobile_flutter/utils/simple_multicolored_line.dart';
import 'package:jdih_mobile_flutter/utils/snackbar_utils.dart';

// import '../widgets/list_bottom_sheet.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.bottomText,
    required this.username,
  });

  final String title, subtitle, bottomText, username;
  final controller = Get.put(DaftarController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 32),
                      // Image.asset(
                      //   "assets/logo-full.png",
                      //   scale: 8,
                      // ),
                      // SizedBox(
                      //   height: 16,
                      // ),
                      // Spacer(),
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 16),
                      SimpleMulticoloredLine.horizontal,
                      SizedBox(height: 16),
                      Text(
                        subtitle,
                        // textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: theme.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 32),
                      TextField(
                        controller: controller.usernameTec..text = username,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          label: Text("Username..."),
                          floatingLabelStyle: textTheme.bodyMedium!.copyWith(
                            color: theme.primaryColor,
                          ),
                          labelStyle: textTheme.bodyMedium!.copyWith(
                            color: Colors.grey.shade400,
                          ),
                          isDense: true,
                          prefixIconConstraints: BoxConstraints.tight(
                            Size(48, 48),
                          ),
                          focusColor: theme.primaryColor,
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: theme.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      TextField(
                        controller: controller.nikTec,
                        keyboardType: TextInputType.number,
                        // obscureText: true,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          label: Text("NIK KTP..."),
                          floatingLabelStyle: textTheme.bodyMedium!.copyWith(
                            color: theme.primaryColor,
                          ),
                          labelStyle: textTheme.bodyMedium!.copyWith(
                            color: Colors.grey.shade400,
                          ),
                          isDense: true,
                          prefixIconConstraints: BoxConstraints.tight(
                            Size(48, 48),
                          ),
                          focusColor: theme.primaryColor,
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: theme.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      TextField(
                        controller: controller.emailTec,
                        keyboardType: TextInputType.emailAddress,
                        // obscureText: true,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          label: Text("Alamat Email..."),
                          floatingLabelStyle: textTheme.bodyMedium!.copyWith(
                            color: theme.primaryColor,
                          ),
                          labelStyle: textTheme.bodyMedium!.copyWith(
                            color: Colors.grey.shade400,
                          ),
                          isDense: true,
                          prefixIconConstraints: BoxConstraints.tight(
                            Size(48, 48),
                          ),
                          focusColor: theme.primaryColor,
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: theme.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      TextField(
                        controller: controller.noHpTec,
                        keyboardType: TextInputType.number,
                        // obscureText: true,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          label: Text("No. WA Aktif..."),
                          floatingLabelStyle: textTheme.bodyMedium!.copyWith(
                            color: theme.primaryColor,
                          ),
                          labelStyle: textTheme.bodyMedium!.copyWith(
                            color: Colors.grey.shade400,
                          ),
                          isDense: true,
                          prefixIconConstraints: BoxConstraints.tight(
                            Size(48, 48),
                          ),
                          focusColor: theme.primaryColor,
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: theme.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      TextField(
                        controller: controller.namaLengkapTec,
                        keyboardType: TextInputType.text,
                        // obscureText: true,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          label: Text("Nama Lengkap..."),
                          floatingLabelStyle: textTheme.bodyMedium!.copyWith(
                            color: theme.primaryColor,
                          ),
                          labelStyle: textTheme.bodyMedium!.copyWith(
                            color: Colors.grey.shade400,
                          ),
                          isDense: true,
                          prefixIconConstraints: BoxConstraints.tight(
                            Size(48, 48),
                          ),
                          focusColor: theme.primaryColor,
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: theme.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      TextField(
                        controller: controller.passwordTec,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          label: Text("Password..."),
                          floatingLabelStyle: textTheme.bodyMedium!.copyWith(
                            color: theme.primaryColor,
                          ),
                          labelStyle: textTheme.bodyMedium!.copyWith(
                            color: Colors.grey.shade400,
                          ),
                          isDense: true,
                          prefixIconConstraints: BoxConstraints.tight(
                            Size(48, 48),
                          ),
                          focusColor: theme.primaryColor,
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: theme.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
              // Spacer(),
              SizedBox(height: 32),
              Text(
                bottomText,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: theme.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 8),
              SimpleMulticoloredLine.horizontal,
              SizedBox(height: 8),
              // SizedBox(
              //   height: 16,
              // ),
              ElevatedButton(
                onPressed: () {
                  // Get.to(MasukPinPage());
                  controller.getUser(
                    onSuccess: (message) {
                      Get.back();
                      Get.showSnackbar(
                        SnackbarUtils.errorSnackbar(text: message),
                      );
                    },
                    onNotFound: (message) {
                      Get.showSnackbar(
                        SnackbarUtils.errorSnackbar(text: message),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Register",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
