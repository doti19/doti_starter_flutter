import 'package:flutter/material.dart';
import 'package:doti_starter/src/core/generated/l10n.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  static const routeName = '/news';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        title: Text(S.of(context).newsScreen),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(),
      ),
    );
  }
}
