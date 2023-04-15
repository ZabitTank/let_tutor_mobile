import 'package:flutter/material.dart';

class AvatarCircle extends StatelessWidget {
  const AvatarCircle(
      {Key? key, required double width, required double height, String? source})
      : _width = width,
        _height = height,
        _source = source,
        super(key: key);

  final double _width;
  final double _height;
  final String? _source;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      decoration: _source ==
                  "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png" ||
              _source == null
          ? const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/person.png"),
                fit: BoxFit.cover,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(1000)),
            )
          : BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(1000)),
              color: Colors.white,
              image: DecorationImage(
                  image: NetworkImage(_source!), fit: BoxFit.cover)),
    );
  }
}
