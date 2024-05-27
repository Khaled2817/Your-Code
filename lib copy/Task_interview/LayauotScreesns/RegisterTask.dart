// ignore_for_file: non_constant_identifier_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shardtool.dart';
import '../Cubits/TaskCubit.dart';
import '../Cubits/TaskStates.dart';
class TaskRegister extends StatelessWidget {
  const TaskRegister({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController PhoneController = TextEditingController();
    TextEditingController NameController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    // bool? fromshard =CashMemmory.getData(key:'isDark');
    return BlocProvider(
      create: (BuildContext) => TaskCubit(TaskInitionalState()),
      child: BlocConsumer<TaskCubit, TaskStates>(
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
                               header(context,head:"Welcome Back",headline: "Enter Your cerdential to Register"),
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
                            x: TaskCubit.get(context).ispassword,
                            passtype: TextInputType.visiblePassword,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  TaskCubit.get(context).changesuffix();
                                },
                                icon: Icon(TaskCubit.get(context).suffix)),
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
                          
                          ElevatedButtonreusable(
                            text: "Register",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                // TaskCubit.get(context).Registeer(
                                //     email: emailController.text,
                                //     password: passwordController.text,
                                //     name:NameController.text,
                                //     phone:PhoneController.text  );
                              }
                            }),
                          signup(onPressed: () {
                            // NavigatTo(context, LoginSocialApp());
                          }),
                        ]),
                  ),
                ),
              ),
            )
          );
        },
        listener: (context, state) {
          // if (state is RegisteerSocilaSuccess) {
          //   NavigatTo(context,HomeSocialApp());
          // }
        },
      ),
    );
  }
}
