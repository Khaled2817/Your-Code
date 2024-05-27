// ignore_for_file: non_constant_identifier_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shardtool.dart';
import '../SocialCubits/cubits/SocialAppCubit.dart';
import '../SocialCubits/cubits/SocialAppStates.dart';
import 'SocialHome.dart';
import 'SocialLogin.dart';

class RegisterSocial extends StatelessWidget {
  const RegisterSocial({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController PhoneController = TextEditingController();
    TextEditingController NameController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    // bool? fromshard =CashMemmory.getData(key:'isDark');
    return BlocProvider(
      create: (BuildContext) => SocialAppCubit(SocialinitialState()),
      child: BlocConsumer<SocialAppCubit, SocialAppStateState>(
        builder: (context, state) {
          return Scaffold(
            body:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                          ),
                          header(context),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormFieldreusable(
                            controller: NameController,
                            passtype: TextInputType.emailAddress,
                            text: 'Username',
                            validate: (value) {
                              if (value.isEmpty)
                                return 'please enter your any Name';
                            },
                            prefixIcon: Icon(Icons.person_2_rounded),
                            x: false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormFieldreusable(
                            controller: emailController,
                            passtype: TextInputType.emailAddress,
                            text: 'Enail',
                            validate: (value) {
                              if (value.isEmpty)
                                return 'please enter your username or email address';
                            },
                            prefixIcon: Icon(Icons.email),
                            x: false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormFieldreusable(
                            controller: passwordController,
                            x: SocialAppCubit.get(context).ispassword,
                            passtype: TextInputType.visiblePassword,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  SocialAppCubit.get(context).changesuffix();
                                },
                                icon: Icon(SocialAppCubit.get(context).suffix)),
                            text: 'password',
                            validate: (value) {
                              if (value.isEmpty)
                                return 'please enter your password';
                            },
                            prefixIcon: Icon(Icons.password_sharp),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormFieldreusable(
                            controller: PhoneController,
                            passtype: TextInputType.emailAddress,
                            text: 'Phone',
                            validate: (value) {
                              if (value.isEmpty)
                                return 'please enter your Phone';
                            },
                            prefixIcon: Icon(Icons.phone),
                            x: false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          
                          ConditionalBuilder(
                            condition: state is!loadingCreateSocialAppStateState,
                            builder: (context) => ElevatedButtonreusable(
                              text: "Register",
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  SocialAppCubit.get(context).Registeer(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name:NameController.text,
                                      phone:PhoneController.text  );
                                }
                              }),
                            fallback: (context) => CircularProgressIndicator(),
                          ),
                          signup(onPressed: () {
                            NavigatTo(context, LoginSocialApp());
                          }),
                        ]),
                  ),
                ),
              ),
            )
          );
        },
        listener: (context, state) {
          if (state is RegisteerSocilaSuccess) {
            NavigatTo(context,HomeSocialApp());
          }
        },
      ),
    );
  }
}
