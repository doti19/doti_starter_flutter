import 'package:doti_starter/index.dart';
import 'package:doti_starter/src/core/generated/l10n.dart';
import 'package:doti_starter/src/core/ui/input/app_text_form_field.dart';
import 'package:doti_starter/src/features/auth/application/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetForm extends StatelessWidget {
  final SignInFormBloc signInFormBloc;
  const ResetForm({super.key, required this.signInFormBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
      bloc: signInFormBloc,
      buildWhen: (p, c) => p.showErrorMessages != c.showErrorMessages,
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            children: [
              AppImages.appLogo,
              AppTextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) =>
                    signInFormBloc.add(SignInFormEvent.emailChanged(value)),
                validator: (_) => signInFormBloc.state.email.value.fold(
                  (f) => f.maybeMap(
                    invalidEmail: (_) =>
                        S.of(context).validEmailVerificationText,
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        );
      },
    );
  }
}
