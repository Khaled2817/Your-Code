
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shardtool.dart';
import '../Cubits/TaskCubit.dart';
import '../Cubits/TaskStates.dart';
import 'RegisterTask.dart';

class TaskLogin extends StatelessWidget {
  const TaskLogin({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    // bool? fromshard =CashMemmory.getData(key:'isDark');
    return BlocProvider(
      create: (context) => TaskCubit(TaskInitionalState()),
      child: BlocConsumer<TaskCubit, TaskStates>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                      ),
                      header(context,head:"Welcome Back",headline: "Enter Your cerdential to Login"),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormFieldreusable(
                        controller: emailController,
                        passtype: TextInputType.emailAddress,
                        text: 'Username',
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
                        text: 'Password',
                          controller: passwordController,
                          x:TaskCubit.get(context).ispassword,
                          passtype: TextInputType.visiblePassword,
                          suffixIcon: IconButton(onPressed: (){TaskCubit.get(context).changesuffix();},
                           icon: Icon(TaskCubit.get(context).suffix)),
                          validate: (value) {
                            if (value.isEmpty)
                              return 'please enter your password';
                          },
                          prefixIcon: Icon(Icons.password_sharp),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButtonreusable(
                            text: "Login",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                // TaskCubit.get(context).LoginSocial(email: emailController.text, password:passwordController.text);
                              }
                            }),
                      signup(onPressed: () { NavigatTo(context,TaskRegister());}),
                      forgotPassword(onPressed: () {
                      
                      }),
                    ]),
              ),
            ),
          );
        },
        listener: (context, state) {
          // if (state is LoginSocilaSuccess) {
          // //  CashMemmory.SaveDate(key:'Id',value: state.Id );
          // //  NavigatTo(context,HomeSocialApp());
          // }
        },
      ),
    );
  }
}
