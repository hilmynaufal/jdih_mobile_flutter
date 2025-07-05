import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SnackbarUtils {
  static GetSnackBar errorSnackbar({required String text}) {
    final theme = Get.theme;
    return GetSnackBar(
      messageText: Text(
        text,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      backgroundColor: theme.colorScheme.error,
      icon: Icon(
        Icons.warning,
        color: Colors.white,
      ),
      duration: Duration(seconds: 3),
    );
  }

  static GetSnackBar successSnackbar(
      {required String title, required String text}) {
    final theme = Get.theme;
    return GetSnackBar(
      titleText: Text(
        title,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      messageText: Text(
        text,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      backgroundColor: theme.primaryColor,
      icon: Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
      duration: Duration(seconds: 3),
    );
  }

  static final dialog = Get.dialog(
    AlertDialog(
      content: Container(
        height: 60,
        width: 60,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 100),
    ),
  );
}