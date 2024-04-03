import 'package:doti_starter/src/core/generated/l10n.dart';
import 'package:doti_starter/src/core/ui/input/app_text_form_field.dart';
import 'package:doti_starter/src/features/auth/application/register_form/register_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterFormBloc, RegisterFormState>(
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
                    .read<RegisterFormBloc>()
                    .add(RegisterFormEvent.emailChanged(value)),
                validator: (_) =>
                    context.read<RegisterFormBloc>().state.email.value.fold(
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
