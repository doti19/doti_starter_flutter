import 'package:flutter/material.dart';
import 'package:doti_starter/index.dart';

class ItemAvatar extends StatelessWidget {
  const ItemAvatar({
    Key? key,
    required this.imageUrl,
    required this.shortenUserName,
  }) : super(key: key);

  final String imageUrl;
  final String shortenUserName;

  @override
  Widget build(BuildContext context) {
    return imageUrl.isNotEmpty
        ? CircleAvatar(backgroundImage: NetworkImage(imageUrl))
        : NameAvatar(name: shortenUserName);
  }
}
