// ignore_for_file: camel_case_types, file_names

import 'package:get/get.dart';

import 'English.dart';
import 'French.dart';
import 'Portuguese.dart';
import 'Spanish.dart';

class lenguLocale extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'en_Us': en, 'es_AI': es, 'pt_AO': pt, 'fr_FR': fr};
}
