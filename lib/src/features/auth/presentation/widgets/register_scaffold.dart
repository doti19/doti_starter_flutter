import 'package:doti_starter/index.dart';
import 'package:doti_starter/src/core/generated/l10n.dart';
import 'package:doti_starter/src/features/auth/application/register_form/register_form_bloc.dart';
import 'package:doti_starter/src/features/auth/presentation/verify_OTP_page.dart';
import 'package:doti_starter/src/features/auth/presentation/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class RegisterScaffold extends StatelessWidget {
  const RegisterScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterFormBloc, RegisterFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
                  (failure) {},
                  (_) => NavigationService().navigateTo(
                    VerifyOTPPage.routeName,
                    arguments: BlocProvider.of<RegisterFormBloc>(context),
                  ),
                ));
      },
      child: KeyboardDismissOnTap(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const RegisterForm(),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    context
                        .read<RegisterFormBloc>()
                        .add(const RegisterFormEvent.generateOTP());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      S.of(context).register,
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
        ),
      ),
    );
  }
}
