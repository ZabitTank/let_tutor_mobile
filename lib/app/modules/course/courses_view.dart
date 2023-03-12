import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/app/modules/course/widgets/course_card.dart';
import 'package:let_tutor_mobile/app/widgets/main_appbar.dart';
import 'package:let_tutor_mobile/app/widgets/search_textfield.dart';
import 'package:let_tutor_mobile/app/widgets/test_widget.dart';
import 'package:let_tutor_mobile/core/theme/base_style.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    const sw_20 = SizedBox(
      width: 20,
    );
    const sh_10 = SizedBox(
      height: 10,
    );
    const sh_20 = SizedBox(
      height: 20,
    );
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: LetTutorCommomWidget.mainAppBar(),
        floatingActionButton: FloatingActionButton(
          hoverColor: BaseColor.green,
          onPressed: () {},
          child: const Icon(Icons.chat_bubble_outline_rounded),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TestWidget.emptyCircleContainer(size: 80),
                    sw_20,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Explore Courses',
                            style: BaseTextStyle.heading2(),
                          ),
                          sh_10,
                          const SearchField()
                        ],
                      ),
                    ),
                  ],
                ),
                sh_20,
                sh_20,
                Text(
                  lorem,
                  style: BaseTextStyle.body2(),
                ),
                sh_20,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Filter Level", style: BaseTextStyle.subtitle3()),
                    MultiSelectDialogField(
                      items: levels.map((e) => MultiSelectItem(e, e!)).toList(),
                      onConfirm: (values) {
                        selectLevelOptionList = values;
                      },
                    ),
                    sh_20,
                    Text("Filter Categories", style: BaseTextStyle.subtitle3()),
                    MultiSelectDialogField(
                      items: categories
                          .map((e) => MultiSelectItem(e, e!))
                          .toList(),
                      onConfirm: (values) {
                        selectLevelOptionList = values;
                      },
                    ),
                    sh_20,
                    Text("Sort", style: BaseTextStyle.subtitle3()),
                    DropdownButton<String>(
                      value: sort,
                      items: sorts
                          .map((String value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (value) {
                        sort = value;
                      },
                    ),
                  ],
                ),
                sh_10,
                SizedBox(
                  height: 50,
                  child: AppBar(
                    bottom: const TabBar(
                      labelColor: BaseColor.black,
                      tabs: [
                        Tab(
                          text: 'Course',
                        ),
                        Tab(
                          text: 'E-Book',
                        ),
                        Tab(
                          text: 'Interactive',
                        )
                      ],
                    ),
                  ),
                ),
                sh_20,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "English for Traveling",
                        style: BaseTextStyle.heading2(),
                      ),
                    ),
                    sh_20,
                    const CourseCard(sh_10: sh_10, sh_20: sh_20),
                    sh_10,
                    const CourseCard(sh_10: sh_10, sh_20: sh_20),
                    sh_10,
                    const CourseCard(sh_10: sh_10, sh_20: sh_20),
                    sh_10,
                    const CourseCard(sh_10: sh_10, sh_20: sh_20),
                    sh_10,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

var selectLevelOptionList = <String?>[];
var selectCategoryOptionList = <String>[];
String? sort = 'ascending';
const levels = <String?>['Any Level', 'Beginner', 'Intermediate', 'Advanced'];
const categories = <String?>[
  'English for Bussiness',
  'English For Fun',
  'Bad English',
  'ChetahPanick'
];
const sorts = ['ascending', 'descending'];

const lorem =
    'Lorem ipsum dolor sit amet, dunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ';
