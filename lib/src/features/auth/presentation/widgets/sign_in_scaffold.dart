import 'package:doti_starter/index.dart';
import 'package:doti_starter/src/core/generated/l10n.dart';
import 'package:doti_starter/src/features/auth/presentation/forgot_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../application/sign_in_form/sign_in_form_bloc.dart';
import 'sign_in_form.dart';

class SignInScaffold extends StatelessWidget {
  const SignInScaffold({super.key});
  static const List<String> scopes = <String>[
    'email',
    'profile',
  ];
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId:
        '''788576458907-nqm3sfuk9c0jsc3q37pu3ra0cj5lfnh8.apps.googleusercontent.com''',
    scopes: scopes,
  );
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
                  (failure) {},
                  (_) => NavigationService().navigateTo(SettingsPage.routeName),
                ));
      },
      child: KeyboardDismissOnTap(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              // shrinkWrap: true,
              children: [
                const SignInForm(),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: CheckboxListTile(
                            title: Text(
                              S.of(context).rememberPassword,
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: true,
                            onChanged: (bool? value) {
                              // setState(() {
                              //   _isRememberPasswordChecked = value ?? false;
                              // });
                            },
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Align(
                        // alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            NavigationService.of(context).navigateTo(
                                ForgotPasswordPage.routeName,
                                arguments: context.read<SignInFormBloc>());
                          },
                          child: Text(
                            S.of(context).forgotPassword,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.fontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    context.read<SignInFormBloc>().add(const SignInFormEvent
                        .signInWithEmailAndPasswordPressed());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      S.of(context).signIn,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Text(S.of(context).orLoginWith),
                SignInButton(
                  Buttons.google,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () async {
                    try {
                      var acc = await _googleSignIn.signIn();
                      print('acc: $acc');
                    } catch (e) {
                      print('error: $e');
                    }
                    // context.read<SignInFormBloc>().add(
                    //       const SignInFormEvent.signInWithGooglePressed(),
                    //     );
                  },
                  // icon: const Icon(FontAwesomeIcons.google),
                  // text: S.of(context).signInWithGoogle,
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
