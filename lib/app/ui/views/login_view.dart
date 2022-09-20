import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrlogistix/app/data/helpers/helpers.dart';
import 'package:qrlogistix/app/domain/enumerators/enumerators.dart';
import 'package:qrlogistix/app/router/app_router.dart';
import 'package:qrlogistix/app/ui/helpers/helpers.dart';
import 'package:qrlogistix/app/ui/providers/providers.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 200, bottom: 5),
            child: Column(
              children: [
                _LoginHeader(),
                const SizedBox(height: 30),
                ChangeNotifierProvider(
                  create: (context) => LoginFormProvider(),
                  child: const _LoginForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: NetworkImage(
            'https://app.qrlogistix.com/media/logos/logo_simbolo.png',
          ),
          height: 60,
        ),
        Container(
          padding: const EdgeInsets.only(top: 30),
          child: const Center(
            child: Text(
              'Sign in to your account',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm({super.key});

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  @override
  Widget build(BuildContext context) {
    final loginFormProvider = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginFormProvider.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          child: Column(
            children: [
              loginFormProvider.authenticationWasSuccessful != null &&
                      !loginFormProvider.authenticationWasSuccessful!
                  ? _setAuthenticationErrorMessage(loginFormProvider)
                  : const SizedBox(height: 0),

              // Email
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorationHelper.authInputDecoration(
                  hintText: 'joe.doe@email.com',
                  labelText: 'Email address',
                ),
                initialValue: 'jefferson.garcia@qrlogistix.com',
                onChanged: (value) => loginFormProvider.email = value,
                validator: (value) {
                  if (loginFormProvider.emailModified &&
                      !loginFormProvider.isValidEmail()) {
                    return loginFormProvider.errorMessage;
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Password
              TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecorationHelper.authInputDecoration(
                  hintText: '********',
                  labelText: 'Password',
                  prefixIcon: Icons.lock_outline,
                ),
                initialValue: '\$\$J3f0.2022',
                onChanged: (value) => loginFormProvider.password = value,
                validator: (value) {
                  if (loginFormProvider.passwordModified &&
                      !loginFormProvider.isValidPassword()) {
                    return loginFormProvider.errorMessage;
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Remember me and Forget your password
              Row(
                children: [
                  Checkbox(
                    value: loginFormProvider.rememberMe,
                    onChanged: (bool? value) {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        loginFormProvider.rememberMe = value!;
                      });
                    },
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pushNamed(
                        context,
                        AppRoutes.getViewRoute(ViewRoutesEnum.recoverPassword),
                      );
                    },
                    child: const Text(
                      "Forget your password?",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Submit
              ElevatedButton(
                onPressed: loginFormProvider.isLoading ||
                        !loginFormProvider.emailModified ||
                        !loginFormProvider.passwordModified
                    ? null
                    : () async {
                        // Se usa para quitar el teclado cuando se presione el botón
                        FocusScope.of(context).unfocus();

                        if (!loginFormProvider.isValidForm()) return;

                        await loginFormProvider.login().then(
                          (value) {
                            if (loginFormProvider
                                .authenticationWasSuccessful!) {
                              print(token);
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.getViewRoute(
                                  ViewRoutesEnum.packageHome,
                                ),
                              );
                            }
                          },
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  loginFormProvider.isLoading ? 'Loading...' : 'Sing in',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _setAuthenticationErrorMessage(LoginFormProvider loginFormProvider) {
    return Column(
      children: [
        const Text(
          'Login failed',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          loginFormProvider.errorMessageAuthentication,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
