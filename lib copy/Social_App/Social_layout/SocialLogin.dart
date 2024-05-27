
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Shop_App/ClassesHelper/CashMemmory.dart';
import '../../shardtool.dart';
import '../SocialCubits/cubits/SocialAppCubit.dart';
import '../SocialCubits/cubits/SocialAppStates.dart';
import 'RegisterSocial.dart';
import 'SocialHome.dart';

class LoginSocialApp extends StatelessWidget {
  const LoginSocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    // bool? fromshard =CashMemmory.getData(key:'isDark');
    return BlocProvider(
      create: (context) => SocialAppCubit(SocialinitialState()),
      child: BlocConsumer<SocialAppCubit, SocialAppStateState>(
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
                          x:SocialAppCubit.get(context).ispassword,
                          passtype: TextInputType.visiblePassword,
                          suffixIcon: IconButton(onPressed: (){SocialAppCubit.get(context).changesuffix();}, icon: Icon(SocialAppCubit.get(context).suffix)),
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
                                SocialAppCubit.get(context).LoginSocial(email: emailController.text, password:passwordController.text);
                              }
                            }),
                      // ConditionalBuilder(
                      //   condition: state is! loadingSocialAppStateState,
                      //   builder: (context) => ElevatedButtonreusable(
                      //       text: "Login",
                      //       onPressed: () {
                      //         if (formKey.currentState!.validate()) {}
                      //       }),
                      //   fallback: (context) => CircularProgressIndicator(),
                      // ),
                      // ignore: prefer_const_constructors
                      signup(onPressed: () { NavigatTo(context, RegisterSocial()) ;}),
                      forgotPassword(onPressed: () {
                      
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
          if (state is LoginSocilaSuccess) {
           CashMemmory.SaveDate(key:'Id',value: state.Id );
           NavigatTo(context,HomeSocialApp());
          }
        },
      ),
    );
  }
}
