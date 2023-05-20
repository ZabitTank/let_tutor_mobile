import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:let_tutor_mobile/app/data/models/rest/let_tutor/tutor_info_detail.dart';
import 'package:let_tutor_mobile/core/utils/helper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TutorIntro extends StatefulWidget {
  const TutorIntro({
    super.key,
    required this.tutor,
  });

  final TutorInfoDetail tutor;

  @override
  State<TutorIntro> createState() => _TutorIntroState();
}

class _TutorIntroState extends State<TutorIntro> {
  String? flag;
  String? countryName;

  @override
  void initState() {
    super.initState();
    _fetchCountryAndFlag();
  }

  Future<void> _fetchCountryAndFlag() async {
    final response = await http.get(
      Uri.parse(
        'https://restcountries.com/v2/alpha/${widget.tutor.country ?? "vn"}',
      ),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      flag = json['flag'];
      countryName = json["name"];
    }
  }

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
                    flag ?? "https://flagcdn.com/vn.svg",
                    height: 15,
                    width: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    countryName ?? "",
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
