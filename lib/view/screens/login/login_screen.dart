import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zydex_hr/components/common_button.dart';
import 'package:zydex_hr/components/common_image_picture.dart';
import 'package:zydex_hr/components/common_text_filed.dart';
import 'package:zydex_hr/util/app_color_constants.dart';
import 'package:zydex_hr/util/dimensions.dart';
import 'package:zydex_hr/components/common_dialog_drop_down.dart';
import 'package:zydex_hr/view/screens/dashboard/dashboard_screen.dart';
import '../../../components/common_title_text.dart';
import '../../../util/images.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  final List<String> langList = const [
    "English",
    "Chinese",
    "Spanish",
    "Hindi",
    "Bengali",
    "Portuguese",
    "Russian",
    "Japanese",
    "Vietnamese",
    "Turkish",
    "Marathi",
    "Telugu",
    "Punjabi",
    "Korean",
    "Tamil",
    "Arabic",
    "German",
    "French",
    "Urdu",
    "Javanese",
    "Italian",
    "Iranian",
    "Gujarati",
    "Hausa",
    "Bhojpuri",
    "Levantine",
  ];

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return Obx(() {
      return Scaffold(
        backgroundColor: AppColorConstants.baseBG,
        appBar: AppBar(
          backgroundColor: AppColorConstants.baseBG,
          actions: [
            GestureDetector(
              onTap: () {
                CommonDialogDropDown.showDropdownDialog<String>(
                  context: context,
                  title: "Select Language",
                  items: langList,
                  selectedItem: loginController.selectedLanguage.value,
                  onTap: (selectedLanguage) {
                    loginController.selectLanguage(selectedLanguage);
                  },
                );
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text(
                      loginController.selectedLanguage.value,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColorConstants.textColor,
                      ),
                    ),
                    const SizedBox(width: 5),
                    CommonImagePicture(
                      Icons.arrow_drop_down,
                      color: AppColorConstants.iconColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: Dimensions.screenwidth * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CommonImagePicture(
                  Images.companyLogo,
                ),
                CommonTextFiled(
                  controller: loginController.userCodeController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColorConstants.borderColor),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColorConstants.borderColor),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColorConstants.blue100, width: 2.0),
                    ),
                    labelText: loginController.companyCodeHintText.value,
                    labelStyle: TextStyle(
                      color: AppColorConstants.hintTextColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CommonButton(
                  title: "Proceed",
                  borderRadius: 40,
                  vertical: 8,
                  onTap: () {
                    Get.to(() => DashboardScreen());
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                    onTap: loginController.toggleInputField,
                    child: Text(
                      loginController.forgetCodeText.value,
                      style: const TextStyle(
                        color: AppColorConstants.blue100,
                        fontSize: 16,
                      ),
                    )),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    showDropdownDialog(context);
                  },
                  child: const Text(
                    "Unlock User!",
                    style: TextStyle(
                      color: AppColorConstants.blue60,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "© Copyright 2023 ZydexHR - V 1.0.0",
                    style: TextStyle(
                      color: AppColorConstants.blue60,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void showDropdownDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          surfaceTintColor: AppColorConstants.baseBG,
          backgroundColor: AppColorConstants.baseBG,
          contentPadding: const EdgeInsets.all(30),
          content: SizedBox(
            width: Dimensions.screenwidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CommonTitleText(title: "Alert"),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Employee code can't be blank",
                  style: TextStyle(color: AppColorConstants.textColor),
                ),
                const SizedBox(
                  height: 30,
                ),
                CommonButton(
                    buttonColor: AppColorConstants.sentimentPositive,
                    borderRadius: 40,
                    vertical: 8,
                    title: "Okay",
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
