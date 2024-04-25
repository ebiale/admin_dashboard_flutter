import 'package:admin_dashboard/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/registration_form_provider.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/views/login/fields/email_field.dart';
import 'package:admin_dashboard/ui/views/login/fields/psw_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: (_) => RegistrationFormProvider(),
      child: Builder(builder: (context) {
        final registrationFormProvider =
            Provider.of<RegistrationFormProvider>(context, listen: false);
        return Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registrationFormProvider.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputStyles(
                            hint: 'Enter your name',
                            label: 'Name',
                            icon: Icons.person_2_outlined),
                        onChanged: (value) {
                          registrationFormProvider.name = value;
                        },
                        onFieldSubmitted: (_) {
                          onFormSubmit(registrationFormProvider, authProvider);
                        },
                        validator: Validators.userValidator,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      EmailField(onChanged: (value) {
                        registrationFormProvider.email = value;
                      }, onFieldSubmitted: (_) {
                        onFormSubmit(registrationFormProvider, authProvider);
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordField(onChanged: (value) {
                        registrationFormProvider.psw = value;
                      }, onFieldSubmitted: (_) {
                        onFormSubmit(registrationFormProvider, authProvider);
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      LinkText(
                        text: 'Login',
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Flurorouter.loginRoute);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomOutlinedButton(
                          onPressed: () {
                            onFormSubmit(
                                registrationFormProvider, authProvider);
                          },
                          text: 'Create Account')
                    ],
                  )),
            ),
          ),
        );
      }),
    );
  }

  void onFormSubmit(RegistrationFormProvider registrationFormProvider,
      AuthProvider authProvider) {
    final isValid = registrationFormProvider.validateForm();

    if (isValid) {
      authProvider.register(registrationFormProvider.email,
          registrationFormProvider.psw, registrationFormProvider.name);
    }
  }
}
