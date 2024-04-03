import 'package:doti_starter/src/core/generated/l10n.dart';
import 'package:doti_starter/src/core/ui/input/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/sign_in_form/sign_in_form_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
      buildWhen: (p, c) => p.showErrorMessages != c.showErrorMessages,
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            children: [
              AppTextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => context
                    .read<SignInFormBloc>()
                    .add(SignInFormEvent.emailChanged(value)),
                validator: (_) =>
                    context.read<SignInFormBloc>().state.email.value.fold(
                          (f) => f.maybeMap(
                            invalidEmail: (_) =>
                                S.of(context).validEmailVerificationText,
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
              ),
              const SizedBox(height: 4),
              AppTextFormField(
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: S.of(context).password,
                ),
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) => context
                    .read<SignInFormBloc>()
                    .add(SignInFormEvent.passwordChanged(value)),
                validator: (_) =>
                    context.read<SignInFormBloc>().state.password.value.fold(
                          (f) => f.maybeMap(
                            shortPassword: (_) =>
                                S.of(context).shortPasswordVerificationText,
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
                obscureText: true,
              ),
            ],
          ),
        );
      },
    );
  }
}
