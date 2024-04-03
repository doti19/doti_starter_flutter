import 'package:doti_starter/index.dart';
import 'package:doti_starter/src/core/generated/l10n.dart';
import 'package:doti_starter/src/features/auth/application/sign_in_form/sign_in_form_bloc.dart';
import 'package:doti_starter/src/features/auth/presentation/reset_password_page.dart';
import 'package:doti_starter/src/features/auth/presentation/widgets/register_form.dart';
import 'package:doti_starter/src/features/auth/presentation/widgets/reset_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});
  static const routeName = 'forgotPassword';
  @override
  Widget build(BuildContext context) {
    final signInFormBloc =
        ModalRoute.of(context)!.settings.arguments as SignInFormBloc;
    return BlocListener<SignInFormBloc, SignInFormState>(
      bloc: signInFormBloc,
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
                  (failure) {},
                  (_) => NavigationService().navigateTo(HomePage.routeName),
                ));
      },
      child: KeyboardDismissOnTap(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ResetForm(signInFormBloc: signInFormBloc),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  signInFormBloc.add(const SignInFormEvent.forgetPassword());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    S.of(context).forgotPassword,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // bottomSheet:
      )),
    );
  }
}
