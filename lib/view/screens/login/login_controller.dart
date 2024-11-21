import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isCompanyCode =
      true.obs; // Controls whether it's "Company Code" or "Email/Phone"
  var companyCodeHintText = "Company code".obs;
  var forgetCodeText = "Don't know company code?".obs;
  var selectedLanguage = "English".obs; // Reactive variable

  TextEditingController userCodeController = TextEditingController();

  // Toggles between "Company Code" and "Email/Phone"
  void selectLanguage(String language) {
    selectedLanguage.value = language;
  }

  void toggleInputField() {
    isCompanyCode.value = !isCompanyCode.value;
    if (isCompanyCode.value) {
      companyCodeHintText.value = "Company code";
      forgetCodeText.value = "Don't know company code?";
    } else {
      companyCodeHintText.value = "Enter email or phone number";
      forgetCodeText.value = "Back To Company Code";
    }
  }
}
