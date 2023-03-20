import 'package:hive/hive.dart';
import 'package:let_tutor_mobile/core/values/enum.dart';

part 'global_setting_hive.g.dart';

@HiveType(typeId: 1)
class GlobalSetting {
  @HiveField(0, defaultValue: false)
  bool isDark;

  @HiveField(1, defaultValue: false)
  bool isAutoRead;

  @HiveField(2)
  LocalizationCode localization;

  GlobalSetting({
    this.isDark = false,
    this.isAutoRead = false,
    this.localization = LocalizationCode.english,
  });
}
