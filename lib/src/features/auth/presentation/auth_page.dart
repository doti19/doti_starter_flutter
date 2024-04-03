// import 'package:auto_route/auto_route.dart';
import 'package:doti_starter/src/core/di/di_container.dart';
import 'package:doti_starter/src/core/generated/l10n.dart';
import 'package:doti_starter/src/features/auth/application/register_form/register_form_bloc.dart';
import 'package:doti_starter/src/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../extra/injection/injection.dart';
// import '../../../extra/routes/app_router.gr.dart';
import '../../core/presentation/widgets/alert_helper.dart';
import '../../core/presentation/widgets/loading_overlay.dart';
import '../application/sign_in_form/sign_in_form_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  static const routeName = 'auth';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: AuthScaffold());
  }
}
