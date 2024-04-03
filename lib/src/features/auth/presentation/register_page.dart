import 'package:doti_starter/index.dart';
import 'package:doti_starter/src/core/generated/colors.gen.dart';
import 'package:doti_starter/src/core/generated/l10n.dart';
import 'package:doti_starter/src/core/ui/input/app_text_form_field.dart';
import 'package:doti_starter/src/features/auth/application/register_form/register_form_bloc.dart';
import 'package:doti_starter/src/features/auth/presentation/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const routeName = 'register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int currentStep = 0;
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
                    HomePage.routeName,
                  ),
                ));
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Register'),
          ),
          body: Stepper(
              type: StepperType.horizontal,
              steps: getSteps(registerFormBloc),
              currentStep: currentStep,
              onStepContinue: () {
                final isLastStep =
                    currentStep == getSteps(registerFormBloc).length - 1;
                if (isLastStep) {
                  //TODO something
                }
                setState(() {
                  if (currentStep < getSteps(registerFormBloc).length - 1) {
                    currentStep += 1;
                  }
                });
              },
              onStepTapped: (value) => setState(() => currentStep = value),
              onStepCancel: () {
                currentStep == 0
                    ? null
                    : setState(() {
                        if (currentStep > 0) {
                          currentStep -= 1;
                        } else {
                          currentStep = 0;
                        }
                      });
              },
              // stepIconBuilder: (stepIndex, stepState) => Icon(Icons.circle),
              controlsBuilder: (context, details) => Row(
                    children: [
                      currentStep == getSteps(registerFormBloc).length - 1
                          ? TextButton(
                              onPressed: () {
                                // print('hoooora');
                                registerFormBloc.add(const RegisterFormEvent
                                    .registerWithEmailAndPasswordPressed());
                              },
                              child: const Text('Register'),
                            )
                          : TextButton(
                              onPressed: details.onStepContinue,
                              child: const Text('Next'),
                            ),
                      if (currentStep != 0)
                        TextButton(
                          onPressed: details.onStepCancel,
                          child: const Text('Back'),
                        ),
                    ],
                  ))),
    );
  }

  List<Step> getSteps(RegisterFormBloc registerFormBloc) => [
        Step(
          isActive: currentStep >= 0,
          state: currentStep == 0 ? StepState.editing : StepState.complete,
          title: Container(),
          // state: StepState.indexed,
          content: personalInformation(registerFormBloc),
        ),
        Step(
          isActive: currentStep >= 1,
          state: currentStep == 1 ? StepState.editing : StepState.complete,
          title: Container(),
          content: ContactInformation(registerFormBloc),
        ),
        Step(
          isActive: currentStep >= 2,
          state: currentStep == 2 ? StepState.editing : StepState.complete,
          title: Container(),
          content: Text('Step 3 content'),
        ),
      ];

  Widget personalInformation(RegisterFormBloc registerFormBloc) {
    return BlocBuilder<RegisterFormBloc, RegisterFormState>(
      bloc: registerFormBloc,
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
                  prefixIcon: Icon(Icons.person),
                  labelText: 'First Name',
                ),
                keyboardType: TextInputType.name,
                onChanged: (value) => registerFormBloc
                    .add(RegisterFormEvent.firstNameChanged(value)),
                validator: (_) => registerFormBloc.state.firstName.value.fold(
                  (f) => f.maybeMap(
                    invalidName: (_) => S.of(context).validFirstNameText,
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
              const SizedBox(height: 4),
              AppTextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Last Name',
                ),
                keyboardType: TextInputType.name,
                onChanged: (value) => registerFormBloc
                    .add(RegisterFormEvent.lastNameChanged(value)),
                validator: (_) => registerFormBloc.state.lastName.value.fold(
                  (f) => f.maybeMap(
                    invalidName: (_) => S.of(context).validLastNameText,
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
              const SizedBox(height: 4),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.people), labelText: 'Role'),
                items: <String>['Player', 'Coach', 'Family', 'Organization']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) =>
                    registerFormBloc.add(RegisterFormEvent.roleChanged(value!)),
                validator: (_) => registerFormBloc.state.role.value.fold(
                  (f) => f.maybeMap(
                    invalidRole: (_) => S.of(context).validRoleText,
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
              const SizedBox(height: 4),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.people), labelText: 'Gender'),
                items: <String>['Male', 'Female', 'Other'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) => registerFormBloc
                    .add(RegisterFormEvent.genderChanged(value!)),
                validator: (_) => registerFormBloc.state.gender.value.fold(
                  (f) => f.maybeMap(
                    invalidGender: (_) => S.of(context).validGenderText,
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  registerFormBloc.add(RegisterFormEvent.phoneNumberChanged(
                      number.parseNumber()));
                  registerFormBloc.add(
                      RegisterFormEvent.phoneNumberCountryCodeChanged(
                          number.isoCode!));
                },
                onInputValidated: (bool _) {
                  registerFormBloc.state.phoneNumber.value.fold(
                    (f) => f.maybeMap(
                      invalidPhoneNumber: (_) =>
                          S.of(context).validPhoneNumberText,
                      orElse: () => null,
                    ),
                    (_) => null,
                  );
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: PhoneNumber(isoCode: 'US'),
                formatInput: false,
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: OutlineInputBorder(),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Date of Birth'),
                onTap: () async {
                  FocusScope.of(context).requestFocus(
                      new FocusNode()); // to prevent opening default keyboard
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor:
                              ColorName.primary, //Change this for picker color
                          colorScheme: ColorScheme.light(
                              primary: ColorName
                                  .learninactivecard), //Change this for dialog background color
                          buttonTheme: ButtonThemeData(
                              textTheme: ButtonTextTheme.primary),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null) {
                    print(pickedDate);
                    registerFormBloc
                        .add(RegisterFormEvent.birthDateChanged(pickedDate));
                  }
                },
              ),
              SizedBox(height: 16),
              AppTextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.place),
                  labelText: 'Place of Birth',
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) => registerFormBloc
                    .add(RegisterFormEvent.placeOfBirthChanged(value)),
                validator: (_) =>
                    registerFormBloc.state.placeOfBirth.value.fold(
                  (f) => f.maybeMap(
                    invalidPlaceOfBirth: (_) =>
                        S.of(context).validPlaceOfBirthText,
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
              const SizedBox(height: 4),
              AppTextFormField(
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  labelText: 'New Password',
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                onChanged: (value) => registerFormBloc
                    .add(RegisterFormEvent.passwordChanged(value)),
                validator: (_) => registerFormBloc.state.password.value.fold(
                  (f) => f.maybeMap(
                    invalidPassword: (_) => S.of(context).validPasswordText,
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

  Widget ContactInformation(RegisterFormBloc registerFormBloc) {
    // PhoneNumber number = PhoneNumber(isoCode: 'US');
    return BlocBuilder<RegisterFormBloc, RegisterFormState>(
      bloc: registerFormBloc,
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
                  prefixIcon: Icon(Icons.location_city),
                  labelText: 'Street Address 1',
                ),
                keyboardType: TextInputType.streetAddress,
                onChanged: (value) => registerFormBloc
                    .add(RegisterFormEvent.streetAddressChanged(value)),
                validator: (_) =>
                    registerFormBloc.state.streetAddress.value.fold(
                  (f) => f.maybeMap(
                    invalidStreetAddress: (_) =>
                        S.of(context).validStreetAddressText,
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
              const SizedBox(height: 4),
              AppTextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_city_outlined),
                  labelText: 'Street Address 2',
                ),
                keyboardType: TextInputType.streetAddress,
                onChanged: (value) => registerFormBloc
                    .add(RegisterFormEvent.streetAddress2Changed(value)),
                validator: (_) =>
                    registerFormBloc.state.streetAddress2!.value.fold(
                  (f) => f.maybeMap(
                    invalidStreetAddress2: (_) =>
                        S.of(context).validStreetAddress2Text,
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
              const SizedBox(height: 4),
              AppTextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_city),
                  labelText: 'City',
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) =>
                    registerFormBloc.add(RegisterFormEvent.cityChanged(value)),
                validator: (_) => registerFormBloc.state.city.value.fold(
                  (f) => f.maybeMap(
                    invalidCity: (_) => S.of(context).validCityText,
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
              const SizedBox(height: 4),
              AppTextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_city),
                  labelText: 'State',
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) =>
                    registerFormBloc.add(RegisterFormEvent.stateChanged(value)),
                validator: (_) => registerFormBloc.state.state.value.fold(
                  (f) => f.maybeMap(
                    invalidState: (_) => S.of(context).validStateText,
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
              const SizedBox(height: 4),
              AppTextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.folder_zip),
                  labelText: 'Zip Code',
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) => registerFormBloc
                    .add(RegisterFormEvent.zipCodeChanged(value)),
                validator: (_) => registerFormBloc.state.zipCode.value.fold(
                  (f) => f.maybeMap(
                    invalidZipCode: (_) => S.of(context).validZipCodeText,
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
              const SizedBox(height: 4),
              AppTextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.nature_people_outlined),
                  labelText: 'Country',
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) => registerFormBloc
                    .add(RegisterFormEvent.countryChanged(value)),
                validator: (_) => registerFormBloc.state.country.value.fold(
                  (f) => f.maybeMap(
                    invalidCountry: (_) => S.of(context).validCountryText,
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
