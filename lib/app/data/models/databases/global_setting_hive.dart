import 'package:hive/hive.dart';

part 'global_setting_hive.g.dart';

@HiveType(typeId: 1)
class GlobalSetting {
  @HiveField(0, defaultValue: false)
  bool isDark;

  @HiveField(1, defaultValue: false)
  bool isAutoRead;

  @HiveField(2)
  String langCode;

  GlobalSetting({
    this.isDark = false,
    this.isAutoRead = false,
    this.langCode = "en",
  });
}
