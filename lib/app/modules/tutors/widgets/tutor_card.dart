import 'package:flutter/material.dart';
import 'package:let_tutor_mobile/app/modules/_utils_widget/utils_widget.dart';
import 'package:let_tutor_mobile/core/values/constants.dart';

class TutorCard extends StatelessWidget {
  const TutorCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {},
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00"),
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
                                    "Chetah",
                                    style: themeData.textTheme.headlineSmall,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.favorite, color: Colors.red),
                                  sw_10,
                                  Text("2"),
                                  Icon(
                                    Icons.star_outlined,
                                    color:
                                        const Color.fromARGB(255, 255, 183, 0),
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
                                3,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Center(
                                      child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 140, 157, 172),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(specifiers[index],
                                        style: themeData.textTheme.bodyMedium),
                                  )),
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
