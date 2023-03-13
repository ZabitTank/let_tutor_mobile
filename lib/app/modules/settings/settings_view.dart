import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/appbar.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/navigation_drawer.dart';
import 'package:let_tutor_mobile/app/modules/settings/settings_controller.dart';
import 'package:let_tutor_mobile/core/languages/my_localization.dart';
import 'package:let_tutor_mobile/core/values/enum.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LetTutorAppBar.mainAppBarWithTitleAndBackButton(
          context: context, title: "Setting"),
      drawer: createNavigationDrawer(),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text(MyLocalization.translate(
                LocalizationKeys.settingscreen_section_common)),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: Text(MyLocalization.translate(
                    LocalizationKeys.settingscreen_section_common_language)),
                value:
                    Text(MyLocalization.translate(LocalizationKeys.language)),
                trailing: const Icon(Icons.keyboard_double_arrow_right),
                onPressed: (context) async {
                  // String? language =
                  //     await _showLanguageDialog(globalSettingProvider);
                  // if (language != null) {
                  //   await _handleChangeLocalized(
                  //       globalSettingProvider, language);
                  //   setState(() {});
                  // }
                },
              ),
              SettingsTile.switchTile(
                onToggle: (value) async {
                  // await globalSettingProvider.toggleTheme(value);
                  // setState(() {});
                },
                initialValue: false,
                leading: const Icon(Icons.format_paint),
                title: Text(MyLocalization.translate(
                    LocalizationKeys.settingscreen_section_common_theme)),
              ),
            ],
          ),
          SettingsSection(
            title: Text(MyLocalization.translate(
                LocalizationKeys.settingscreen_section_gpt)),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.key),
                title: Text(MyLocalization.translate(
                    LocalizationKeys.settingscreen_section_gpt_key)),
                trailing: const Icon(Icons.edit),
                onPressed: (context) async {
                  // String? initKey = await GlobalSettingProvider.getAPIKey();
                  // String? newApiKey = await _showKeyDialog(initKey);
                  // await globalSettingProvider.handleUseAPIKey(newApiKey);
                  // setState(() {});
                },
              ),
              // SettingsTile.switchTile(
              //   onToggle: (value) async {
              //     // await globalSettingProvider.toggleAutoRead(value);
              //     // setState(() {});
              //   },
              //   initialValue: globalSettingProvider.appSettings.isAutoRead,
              //   leading: const Icon(Icons.voice_chat),
              //   title: Text(MyLocalization.translate(
              //       LocalizationKeys.settingscreen_section_auto_voice)),
              // ),
              SettingsTile.navigation(
                leading: const Icon(Icons.history),
                title: Text(MyLocalization.translate(
                    LocalizationKeys.settingscreen_section_chatlog)),
                value: Text(MyLocalization.translate(
                    LocalizationKeys.settingscreen_section_gpt_delete)),
                trailing: const Icon(Icons.delete),
                onPressed: (context) async {
                  // bool? confirm = await showYesNoDialog(
                  //     context,
                  //     MyLocalization.translate(
                  //         LocalizationKeys.settingscreen_section_gpt_delete),
                  //     MyLocalization.translate(LocalizationKeys
                  //         .settingscreen_section_gpt_delete_confirm));

                  // if (confirm != null && confirm == true) {
                  //   await chatProvider.clearChatlog();
                  // } else {}
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
