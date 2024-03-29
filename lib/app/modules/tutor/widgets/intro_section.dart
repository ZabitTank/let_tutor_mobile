import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/custom_widget.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/app/modules/tutor/tutor_controller.dart';
import 'package:let_tutor_mobile/app/modules/tutor/widgets/dialog_review.dart';
import 'package:let_tutor_mobile/app/modules/tutor/widgets/tutor_intro.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';
import 'package:let_tutor_mobile/core/utils/helper.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({
    Key? key,
    required,
    required this.controller,
  }) : super(key: key);
  final TutorController controller;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final tutor = controller.tutor;
    double? rating = controller.tutor.rating;
    return Obx(
      () => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                color: themeData.primaryColor,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TutorIntro(
                  tutor: tutor,
                  countryName: controller.countryName ?? "Vietnamse",
                  flag: controller.flag ?? "https://flagcdn.com/vn.svg",
                ),
                sh_20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Obx(
                          () => IconButton(
                            onPressed: () async {
                              await controller.addFavorite();
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: controller.isFavorite.value
                                  ? themeData.highlightColor
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          "Favorite",
                          style: BaseTextStyle.label2(
                              color: themeData.highlightColor),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.warning,
                        ),
                        Text(
                          "Report",
                          style: BaseTextStyle.label2(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.dialog(ReviewsDialog(
                                userId: controller.tutor.userId!));
                          },
                          icon: Icon(
                            Icons.reviews,
                            color: themeData.primaryColor,
                          ),
                        ),
                        Text(
                          "Review",
                          style: BaseTextStyle.label2(
                              color: themeData.primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
                sh_20,
                Text(tutor.bio ??
                    "bio bio bio biobiobiobiobiobiobiobiobiobiobiobiobiobio"),
                sh_20,
                Text(
                  "Ratting",
                  style: themeData.textTheme.titleLarge,
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) => Container(
                      padding: const EdgeInsets.only(right: 4),
                      child: rating == null
                          ? Icon(
                              Icons.star,
                              color: themeData.highlightColor,
                            )
                          : Icon(
                              index < (rating) - 0.5
                                  ? Icons.star
                                  : index -
                                              (tutor.User?.getRating() ?? 0) +
                                              0.25 >
                                          0
                                      ? Icons.star_border
                                      : Icons.star_half,
                              color: Colors.yellow[700],
                              size: 20,
                            ),
                    ),
                  ),
                ),
                sh_20,
                Text(
                  "Languages",
                  style: themeData.textTheme.titleLarge,
                ),
                sh_10,
                controller.tutor.languages != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: List.generate(
                              controller.tutor.toListLanguges().length,
                              (index) {
                            return ChipInfo(
                              themeData: themeData,
                              info: Helper.getLanguageName(
                                controller.tutor.toListLanguges()[index],
                              ),
                            );
                          }),
                        ),
                      )
                    : Container(),
                sh_20,
                Text(
                  "Specialties",
                  style: themeData.textTheme.titleLarge,
                ),
                sh_10,
                controller.tutor.specialties != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Wrap(
                          runSpacing: 5,
                          children: List.generate(
                              controller.tutor.toListspecialties().length,
                              (index) {
                            return ChipInfo(
                              themeData: themeData,
                              info: controller.tutor.toListspecialties()[index],
                            );
                          }),
                        ),
                      )
                    : Container(),
                Text(
                  "Interests",
                  style: themeData.textTheme.titleLarge,
                ),
                Text(tutor.interests ?? ""),
                sh_10,
                Text(
                  "Teaching Experience",
                  style: themeData.textTheme.titleLarge,
                ),
                Text(tutor.experience ?? ""),
                sh_10,
              ],
            ),
    );
  }
}
