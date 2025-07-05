import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController extends GetxController {
  final isPrivacyAgreed = false.obs;

  @override
  onInit() async {
    super.onInit();
    isPrivacyAgreed.value = await getPrivacyAgreed();
  }

  setPrivacyAgreed(bool value) async {
    final editor = await SharedPreferences.getInstance();
    editor.setBool("privacy_agreed", value);
    isPrivacyAgreed.value = value;
  }

  Future<bool> getPrivacyAgreed() async {
    final editor = await SharedPreferences.getInstance();
    return editor.getBool("privacy_agreed") != null;
  }
}
