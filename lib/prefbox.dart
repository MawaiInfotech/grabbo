import 'package:hive/hive.dart';

const kPrefsBox = "prefs_box";
const kUserId = "user_code";

String get userId => prefsBox.get(kUserId,defaultValue: "");
final prefsBox = Hive.box(kPrefsBox);