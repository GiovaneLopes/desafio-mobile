import 'package:app_dictionary/core/input_validators/validations_mixin.dart';
import 'package:app_dictionary/core/ui/custom_text_form_field.dart';
import 'package:app_dictionary/features/auth/presenter/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidationsMixin {
  final LoginCubit cubit = Modular.get();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Login'),
          ],
        ),
      ),
      body: BlocConsumer(
        bloc: cubit,
        listener: (context, state) {
          if (state.runtimeType == LoginErrorState) {
            final errorState = state as LoginErrorState;
            var snackBar = SnackBar(
              content: Text(
                errorState.failure.errorMessage,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 68,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: emailController,
                            hintText: 'Email',
                            textInputType: TextInputType.emailAddress,
                            validator: (value) => combine([
                              () => isNotEmpty(value),
                              () => isEmailValid(value),
                            ]),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomTextFormField(
                            controller: passwordController,
                            obscureText: obscureText,
                            textInputType: TextInputType.text,
                            hintText: 'Senha',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.grey,
                              ),
                            ),
                            validator: (value) => combine([
                              () => isNotEmpty(value),
                              () => hasMinLength(value, 8),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal[300],
                                  shape: const StadiumBorder(),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await cubit.login(emailController.text,
                                        passwordController.text);
                                  }
                                },
                                child: state.runtimeType == LoginLoadingState
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                      )
                                    : const Text(
                                        'Entrar',
                                      ),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Modular.to.pushNamed('/registration');
                          },
                          child: Text(
                            'Cadastrar',
                            style: TextStyle(
                              color: Colors.teal[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
