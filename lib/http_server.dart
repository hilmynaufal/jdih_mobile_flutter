import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jdih_mobile_flutter/utils/snackbar_utils.dart';

class HttpServer extends GetxController {
  final apiUrl = "https://jdihdprd.bandungkab.go.id/".obs;
  // final apiTest = 0.obs;

  Future<void> getApiUrl() async {
    // final response = await http.get(
    //   Uri.parse("https://hilmyblaze.icu/ppid_api/url"),
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    // ).timeout(
    //   const Duration(seconds: 10),
    //   onTimeout: () {
    //     Get.showSnackbar(SnackbarUtils.errorSnackbar(text: "Response Timeout"));

    //     return http.Response('', 408);
    //   },
    // );

    // if (response.statusCode == 200) {
    //   log(response.body);
    //   final responseData = jsonDecode(response.body);
    //   apiUrl.value = responseData['data'][0];
    //   return;
    // } else {
    //   throw Exception('Failed to post data');
    // }
    // apiUrl.value = "https://ppid.bandungkab.go.id/";
  }

  Future<String> postRequest(String subdomain, Map<String, String> body) async {
    final response = await http.post(
      Uri.parse("${apiUrl.value}$subdomain"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<String> getRequest(String subdomain) async {
    // log("KONZ");
    final response = await http.get(
      Uri.parse("${apiUrl.value}$subdomain"),
      headers: {'Content-Type': 'application/json'},
    );

    // log("KONZ");

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<String> postMultiPart(
    String subdomain,
    Map<String, String> fields,
  ) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse("${apiUrl.value}$subdomain"),
    );

    request.fields.addAll(fields);

    final response = await request.send();

    if (response.statusCode == 200) {
      // log(await response.stream.bytesToString());
      return response.stream.bytesToString();
    } else {
      // log(await response.stream.bytesToString());
      throw Exception('Failed to multipart');
    }
  }
}
