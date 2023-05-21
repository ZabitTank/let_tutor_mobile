import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/tutor_info_detail.dart';

class TutorIntro extends StatefulWidget {
  const TutorIntro({
    super.key,
    required this.tutor,
    required this.flag,
    required this.countryName,
  });

  final TutorInfoDetail tutor;
  final String flag;
  final String countryName;
  @override
  State<TutorIntro> createState() => _TutorIntroState();
}

class _TutorIntroState extends State<TutorIntro> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(widget.tutor.avatar ??
              "https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00"),
          radius: 45,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.tutor.name ?? "Teacher name",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 5),
              Text(widget.tutor.profession ?? "profession"),
              const SizedBox(height: 5),
              Row(
                children: [
                  SvgPicture.network(
                    widget.flag,
                    height: 15,
                    width: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.countryName,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
