import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shardtool.dart';
import '../../cubits/LoginClassStatus copy.dart';
import '../../cubits/LoginCubit.dart';
import '../Home/Home.dart';
import 'Resgister.dart';

class LoginShopApp extends StatelessWidget {
  const LoginShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    // bool? fromshard =CashMemmory.getData(key:'isDark');
    var cubit = LoginCubit.get(context);
    return BlocProvider(
      create: (BuildContext) => LoginCubit(LOgininitialState()),
      child: BlocConsumer<LoginCubit, LoginStates>(
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
                      header(context),
                      SizedBox(
                        height: 20,
                      ),
                      // TextFormFieldreusable(
                      //   Usernamecontroller:emailController ,
                      //   Passtype:  TextInputType.emailAddress,
                      //      hinttext: 'Username',
                      //      validate:(value){
                      //       if(value.isEmpty)
                      //         return 'please enter your username or email address';
                      //      },
                      //      prefixIcon:Icon(Icons.email) , secuer: false,
                      //       icon: Icon(Icons.person_2_rounded),

                      //     ),
                      TextFormFieldreusable(
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'please enter your username or email address';
                            }
                          },
                          controller: emailController,
                          text: 'Username',
                          prefixIcon: Icon(Icons.person), 
                         ),
                          SizedBox(
                        height: 20,
                      ),
                      TextFormFieldreusable(
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Password is very sshort';
                            }
                          },
                          controller: passwordController,
                          text: 'Username',
                          prefixIcon: Icon(Icons.password),
                          passtype: TextInputType.visiblePassword,
                          x: LoginCubit.get(context).ispassword,
                          suffixIcon: IconButton(
                              onPressed: () {
                                LoginCubit.get(context).changesuffix();
                              },
                              icon: Icon(LoginCubit.get(context).suffix)),),
                      SizedBox(
                        height: 20,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoadingnitialState,
                        builder: (context) => ElevatedButtonreusable(
                            text: "Login",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).Userlogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            }),
                        fallback: (context) => CircularProgressIndicator(),
                      ),
                      signup(onPressed: () {
                        NavigatTo(context, Register());
                      }),
                      forgotPassword(onPressed: () {
                        print("object");
                      }),
                      // signup(onPressed:(){
                      //  NavigatTo(context,Register());
                      // }),
                    ]),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is LOginSuccsessState) {
            NavigatTo(context, Home());
          }
        },
      ),
    );
  }
}
