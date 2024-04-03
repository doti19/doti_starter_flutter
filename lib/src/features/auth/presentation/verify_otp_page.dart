import 'package:doti_starter/index.dart';
import 'package:doti_starter/src/core/generated/l10n.dart';
import 'package:doti_starter/src/core/ui/input/app_text_form_field.dart';
import 'package:doti_starter/src/features/auth/application/register_form/register_form_bloc.dart';
import 'package:doti_starter/src/features/auth/presentation/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyOTPPage extends StatelessWidget {
  const VerifyOTPPage({super.key});
  static const routeName = 'verifyOTP';
  @override
  Widget build(BuildContext context) {
    final registerFormBloc =
        ModalRoute.of(context)!.settings.arguments as RegisterFormBloc;
    return BlocListener<RegisterFormBloc, RegisterFormState>(
      bloc: registerFormBloc,
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
                  (failure) {},
                  (_) => NavigationService().navigateTo(
                    RegisterPage.routeName,
                    arguments: registerFormBloc,
                  ),
                ));
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).verifyOTP),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AppImages.appLogo,
                SizedBox(height: 16),
                Text(
                  S.of(context).thankYouForRegistering,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 8),
                Text(
                  S.of(context).sentYouCode,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Form(
                  // autovalidateMode: state.showErrorMessages
                  //     ? AutovalidateMode.always
                  //     : AutovalidateMode.disabled,
                  child: AppTextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.numbers),
                      labelText: 'OTP',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => registerFormBloc
                        .add(RegisterFormEvent.otpChanged(value)),
                    validator: (_) => registerFormBloc.state.otp.value.fold(
                      (f) => f.maybeMap(
                        invalidOTP: (_) => S.of(context).validOTPText,
                        orElse: () => null,
                      ),
                      (_) => null,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    registerFormBloc.add(const RegisterFormEvent.verifyOTP());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      S.of(context).verifyOTP,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
