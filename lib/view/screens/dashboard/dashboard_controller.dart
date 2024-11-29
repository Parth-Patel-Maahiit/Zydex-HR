import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxList<Birthday> yesterdayBirthdays = [
    Birthday(name: "Tarun Jadav", image: "", titel: "Mr."),
    Birthday(name: "Harsh Jadav", image: "", titel: "Mr."),
    Birthday(name: "Priya Jadav", image: "", titel: "Msr."),
  ].obs;

  final RxList<Birthday> todayBirthdays = [
    Birthday(name: "Nirav Darjee", image: "", titel: "Mr."),
    Birthday(name: "Keyur Patel", image: "", titel: "Mr."),
    Birthday(name: "Pooja Patel", image: "", titel: "Msr."),
  ].obs;

  final RxList<Birthday> tomorrowBirthdays = [
    Birthday(name: "Parth Patel", image: "", titel: "Mr."),
    Birthday(name: "Saikiran Kota", image: "", titel: "Mr."),
    Birthday(name: "Riya Kota", image: "", titel: "Msr."),
  ].obs;

  final RxList<Birthday> currentBirthdays = <Birthday>[].obs;

  @override
  void onInit() {
    super.onInit();
    currentBirthdays.assignAll(todayBirthdays);
  }

  void selectDays(String currentDay) {
    if (currentDay == "yesterday") {
      currentBirthdays.assignAll(yesterdayBirthdays);
    } else if (currentDay == "today") {
      currentBirthdays.assignAll(todayBirthdays);
    } else if (currentDay == "tomorrow") {
      currentBirthdays.assignAll(tomorrowBirthdays);
    }
  }
}

class Birthday {
  String name;
  String image;
  String titel;

  Birthday({
    required this.name,
    required this.titel,
    required this.image,
  });
}
