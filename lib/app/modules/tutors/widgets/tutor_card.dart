import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/tutor_info_detail.dart';
import 'package:let_tutor_mobile/app/modules/_global_widget/custom_widget.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/routes/app_routes.dart';

class TutorCard extends StatefulWidget {
  const TutorCard({
    Key? key,
    required this.tutor,
    required this.addFavorite,
  }) : super(key: key);

  final TutorInfoDetail tutor;
  final Future<void> Function(String tutorId) addFavorite;

  @override
  State<TutorCard> createState() => _TutorCardState();
}

class _TutorCardState extends State<TutorCard> {
  TutorInfoDetail? stateTutor;
  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      stateTutor = widget.tutor;

      isFavorite = stateTutor?.isfavoritetutor != null ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final skill = widget.tutor.specialties?.split(",");
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.teacherDetail, arguments: widget.tutor);
        },
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage((widget.tutor.avatar ==
                                  null ||
                              widget.tutor.avatar ==
                                  "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png")
                          ? "https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00"
                          : widget.tutor.avatar!),
                      radius: 30,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    stateTutor?.name ?? "Name",
                                    style: themeData.textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await widget.addFavorite
                                          .call(widget.tutor.userId!);
                                      setState(() {
                                        if (stateTutor?.isfavoritetutor ==
                                            null) {
                                          stateTutor?.isfavoritetutor == "1";
                                        } else {
                                          stateTutor?.isfavoritetutor == null;
                                        }
                                        isFavorite = !isFavorite;
                                      });
                                    },
                                    child: Icon(Icons.favorite,
                                        color: !isFavorite
                                            ? Colors.black
                                            : Colors.red),
                                  ),
                                  sw_10,
                                  Text(widget.tutor.rating?.ceil().toString() ??
                                      ""),
                                  Icon(
                                    Icons.star_outlined,
                                    color: widget.tutor.rating == null
                                        ? Colors.grey
                                        : const Color.fromARGB(
                                            255, 255, 183, 0),
                                    size: 16,
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 40,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                skill?.length ?? 0,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Center(
                                    child: ChipInfo(
                                        info: skill![index],
                                        themeData: themeData),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  widget.tutor.bio ??
                      "bla bla bal bla bla bla bla bla bla bla bla bla bal bla bla bal bla bla bla bla bla bla bla bla bla balbla bla bal bla bla bla bla bla bla bla bla bla balbla bla bal bla bla bla bla bla bla bla bla bla balbla bla bal bla bla bla bla bla bla bla bla bla balbla bla bal bla bla bla bla bla bla bla bla bla bal",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
