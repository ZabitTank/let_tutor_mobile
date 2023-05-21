import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/appbar.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/custom_widget.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/navigation_drawer.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/settings/settings_controller.dart';
import 'package:let_tutor_mobile/core/extensions/string.dart';
import 'package:let_tutor_mobile/core/extensions/textstyle.dart';
import 'package:let_tutor_mobile/core/values/constants.dart';
import 'package:let_tutor_mobile/core/values/enum.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              appBar: LetTutorAppBar.mainAppBarWithTitleAndBackButton(
                  context: context, title: "Setting"),
              drawer: createNavigationDrawer(),
              body: Obx(
                () => SettingsList(
                  sections: [
                    SettingsSection(
                      title: Text(LocalizationKeys
                          .settingscreen_section_common.name.tr),
                      tiles: <SettingsTile>[
                        SettingsTile.navigation(
                          leading: const Icon(Icons.language),
                          title: Text(LocalizationKeys
                              .settingscreen_section_common_language.tr),
                          value: Text(LocalizationKeys.currentLanguages.tr),
                          trailing: PopupMenuButton<String>(
                            icon: const Icon(Icons.language),
                            onSelected: (String result) async {
                              await controller.appStateController
                                  .toggleLocalization(result);
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: "en",
                                child: IconWithTitleTile(
                                  icon: Image.asset(
                                    AssetsManager.enIcon,
                                    height: 20,
                                    width: 20,
                                  ),
                                  title: Text(
                                      LocalizationKeys.englishLocales.tr,
                                      style: context.bodySmall),
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'vi',
                                child: IconWithTitleTile(
                                  icon: Image.asset(
                                    AssetsManager.vnIcon,
                                    height: 20,
                                    width: 20,
                                  ),
                                  title: Text(
                                      LocalizationKeys.vietnamLocales.tr,
                                      style: context.bodySmall),
                                ),
                              ),
                            ],
                          ),
                          onPressed: (context) async {},
                        ),
                        SettingsTile.switchTile(
                          onToggle: (value) async {
                            await controller.changeTheme(value);
                          },
                          initialValue: controller.isDarkMode.value,
                          leading: const Icon(Icons.format_paint),
                          title: Text(LocalizationKeys
                              .settingscreen_section_common_theme.tr),
                        ),
                      ],
                    ),
                    SettingsSection(
                      title:
                          Text(LocalizationKeys.settingscreen_section_gpt.tr),
                      tiles: <SettingsTile>[
                        SettingsTile.navigation(
                          leading: const Icon(Icons.key),
                          title: Text(LocalizationKeys
                              .settingscreen_section_gpt_key.tr),
                          trailing: const Icon(Icons.edit),
                          onPressed: (context) async {
                            await controller.changeAPIKey();
                          },
                        ),
                        SettingsTile.switchTile(
                          onToggle: (value) async {
                            await controller.toggleAutoRead(value);
                          },
                          initialValue: controller.isAutoRead.value,
                          leading: const Icon(Icons.voice_chat),
                          title: Text((LocalizationKeys
                              .settingscreen_section_auto_voice.tr)),
                        ),
                        SettingsTile.navigation(
                          leading: const Icon(Icons.history),
                          title: Text(LocalizationKeys
                              .settingscreen_section_chatlog.tr),
                          value: Text(
                            (LocalizationKeys
                                .settingscreen_section_gpt_delete.tr),
                          ),
                          trailing: const Icon(Icons.delete),
                          onPressed: (context) async {
                            bool? confirm = await showYesNoDialog(
                                (LocalizationKeys
                                    .settingscreen_section_gpt_delete.tr),
                                (LocalizationKeys
                                    .settingscreen_section_gpt_delete_confirm
                                    .tr));

                            if (confirm != null && confirm == true) {
                              await controller
                                  .homeController.chatController.chatProvider
                                  .clearChatlog();
                            } else {}
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
