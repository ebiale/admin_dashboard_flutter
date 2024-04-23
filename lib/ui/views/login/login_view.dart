import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/views/login/fields/email_field.dart';
import 'package:admin_dashboard/ui/views/login/fields/psw_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(builder: (context) {
          final loginFormProvider =
              Provider.of<LoginFormProvider>(context, listen: false);
          return Container(
            margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: loginFormProvider.formKey,
                    child: Column(
                      children: [
                        EmailField(
                          onChanged: (value) {
                            loginFormProvider.email = value;
                          },
                          onFieldSubmitted: (_) {
                            onFormSubmit(loginFormProvider, authProvider);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        PasswordField(
                          onChanged: (value) {
                            loginFormProvider.psw = value;
                          },
                          onFieldSubmitted: (_) {
                            onFormSubmit(loginFormProvider, authProvider);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LinkText(
                          text: 'Registration',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Flurorouter.registerRoute);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomOutlinedButton(
                            onPressed: () {
                              onFormSubmit(loginFormProvider, authProvider);
                            },
                            text: 'Enter')
                      ],
                    )),
              ),
            ),
          );
        }));
  }

  void onFormSubmit(
      LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();

    if (isValid) {
      authProvider.login(loginFormProvider.email, loginFormProvider.psw);
    }
  }
}
