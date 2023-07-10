import 'package:app_dictionary/core/input_validators/validations_mixin.dart';
import 'package:app_dictionary/core/ui/custom_text_form_field.dart';
import 'package:app_dictionary/features/auth/domain/entities/user_entity.dart';
import 'package:app_dictionary/features/auth/presenter/registration/registration_cubit.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with ValidationsMixin {
  final RegistrationCubit cubit = Modular.get();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () {
                Modular.to.pop();
              },
              icon: const Icon(
                FeatherIcons.arrowLeft,
              ),
            ),
            const Text(
              'Cadastro',
            ),
            Container(
              width: 35,
            ),
          ],
        ),
      ),
      body: BlocConsumer(
        bloc: cubit,
        listener: (context, state) {
          if (state.runtimeType == RegistrationSuccessState) {
            Modular.to.navigate('/home');
          } else if (state.runtimeType == RegistrationErrorState) {
            final errorState = state as RegistrationErrorState;
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
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(22, 36, 22, 0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Name
                    CustomTextFormField(
                      controller: nameController,
                      hintText: 'Nome',
                      validator: (val) => combine(
                        [
                          () => isNotEmpty(val),
                          () => hasMinLength(val, 4),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    // Email
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'Email',
                      textInputType: TextInputType.emailAddress,
                      validator: (val) => combine([
                        () => isNotEmpty(val),
                        () => isEmailValid(val),
                      ]),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    // Password
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Senha',
                      obscureText: obscurePassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                        icon: Icon(
                          obscurePassword
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
                    const SizedBox(
                      height: 22,
                    ),
                    // Repeat Password
                    CustomTextFormField(
                      controller: repeatPasswordController,
                      hintText: 'Repita a senha',
                      obscureText: true,
                      validator: (val) => combine([
                        () => isNotEmpty(val),
                        () => equalPassword(val, passwordController.text),
                      ]),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    // Diabetes
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Sign Up Button
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal[300],
                                  shape: const StadiumBorder(),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    final user = UserEntity(
                                      name: nameController.text,
                                      email: emailController.text,
                                    );
                                    cubit.registration(
                                        user, passwordController.text);
                                  }
                                },
                                child: state.runtimeType ==
                                        RegistrationLoadingState
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                      )
                                    : const Text(
                                        'Cadastrar',
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
