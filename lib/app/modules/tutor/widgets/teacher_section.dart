import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:let_tutor_mobile/app/data/models/teacher.dart';
import 'package:let_tutor_mobile/app/modules/tutor/tutor_controller.dart';

class TeacherSection extends StatefulWidget {
  const TeacherSection(
      {Key? key, required this.teacher, required, required this.controller})
      : super(key: key);
  final TeacherInfo teacher;
  final TutorController controller;

  @override
  State<TeacherSection> createState() => _TeacherSectionState();
}

class _TeacherSectionState extends State<TeacherSection> {
  Future<void> fetchCountry() async {
    final response = await http.get(
      Uri.parse(
        'https://restcountries.com/v2/alpha/${widget.teacher.user!.country}',
      ),
    );
    if (response.statusCode == 200) {
      setState(() {
        json = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load album');
    }
  }

  Map<String, dynamic> json = {};
  @override
  void initState() {
    super.initState();
    fetchCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.teacher.user?.avatar ?? ""),
              radius: 45,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.teacher.user?.name ?? "",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 5),
                Text("English Teacher"),
                const SizedBox(height: 5),
                Row(
                  children: [
                    SvgPicture.network(
                      json["flag"] ?? "https://flagcdn.com/vn.svg",
                      height: 15,
                      width: 30,
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 200,
                      child: Text(
                        "${json["name"] ?? "none"}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                5,
                (index) => Container(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(
                    index < (widget.teacher.user?.getRating() ?? 0) - 0.5
                        ? Icons.star
                        : index - widget.teacher.user!.getRating() + 0.25 > 0
                            ? Icons.star_border
                            : Icons.star_half,
                    color: Colors.yellow[700],
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(Icons.favorite),
                Text("Favorite"),
              ],
            ),
            Column(
              children: [
                Icon(Icons.warning),
                Text("Report"),
              ],
            ),
          ],
        ),
        Text(widget.teacher.bio ?? "")
      ],
    );
  }
}
