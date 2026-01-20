import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:jdih_mobile_flutter/controllers/login_controller.dart';
import 'package:jdih_mobile_flutter/utils/simple_multicolored_line.dart';
import 'package:jdih_mobile_flutter/utils/snackbar_utils.dart';

// import '../widgets/list_bottom_sheet.dart';

class MasukPinPage extends StatelessWidget {
  MasukPinPage({super.key});

  final controller = Get.put(LoginController());

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
              SizedBox(height: 32),
              Spacer(),
              Text(
                "Selamat Datang kembali \n${controller.usernameTec.text}!",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              SimpleMulticoloredLine.horizontal,
              SizedBox(height: 16),

              Text(
                "Silahkan masukkan Password anda untuk masuk",
                // textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 8),
              // Spacer(),
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
                  prefixIconConstraints: BoxConstraints.tight(Size(48, 48)),
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
              Spacer(),
              // Divider(
              //   color: Colors.grey.shade600,
              // ),
              SimpleMulticoloredLine.horizontal,
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Get.to(MasukPinPage());
                  controller.getUser(
                    onSuccess: (u) {
                      Get.back();
                      Get.back();
                    },
                    onNotFound: (error) {
                      Get.showSnackbar(
                        SnackbarUtils.errorSnackbar(text: error),
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
                  "Masuk",
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
