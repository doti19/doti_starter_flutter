import 'package:doti_starter/src/core/constants/style/images.dart';
import 'package:doti_starter/src/features/auth/presentation/widgets/register_scaffold.dart';
import 'package:doti_starter/src/features/auth/presentation/widgets/sign_in_scaffold.dart';
import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppImages.appLogo,
          auths(context),
        ],
      ),
    );
  }
}

Widget auths(BuildContext context) {
  return Expanded(
    child: DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            alignment: Alignment.center,
            child: const TabBar(
              tabAlignment: TabAlignment.center,
              tabs: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Tab(
                    child: Text('Sign In'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Tab(text: 'Register'),
                ),
              ],
            ),
          ),
        ),
        body: Stack(children: [
          const TabBarView(
            children: [
              // Replace with your Sign In and Sign Up forms
              SignInScaffold(),
              RegisterScaffold(),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomPaint(
              size: Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height *
                      0.2), // You can change the size as needed
              painter: UShapePainter(
                  color: Theme.of(context)
                      .primaryColor), // You can change the color as needed
            ),
          ),
        ]),
      ),
    ),
  );
}

class UShapePainter extends CustomPainter {
  final Color color;

  UShapePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = color;
    var path = Path()
      ..moveTo(0, size.height * 0.1)
      ..quadraticBezierTo(size.width / 2, size.height / 2, size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
