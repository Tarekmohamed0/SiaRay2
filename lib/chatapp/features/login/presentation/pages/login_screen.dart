import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/chatapp/blocs/bloc/auth_bloc.dart';
import 'package:first_project/chatapp/core/routes/names.dart';
import 'package:first_project/chatapp/core/utils/email_validator.dart';
import 'package:first_project/chatapp/core/utils/passowrd_validator.dart';
import 'package:first_project/chatapp/features/chat/presentation/cubit/chat_cubit.dart';
// import 'package:first_project/chatapp/features/login/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../register/presentation/pages/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          var snackbar = const SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'warning!',
              message: 'loading login',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackbar);
        } else if (state is LoginSucsess) {
          BlocProvider.of<ChatCubit>(context).getmessages();
          Navigator.of(context).pushNamed(RoutesName.chat);
          var snackbar = const SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Congrats!',
              message: 'you have successfully logged in to the chat app 2',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.success,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackbar);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Login Screen'),
          ),
          body: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Center(
                //   child: RepaintBoundary(
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(10),
                //       child: Image.network('https://picsum.photos/250?image=9',
                //           width: 100, height: 100, fit: BoxFit.cover),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Scolar chat app'),
                const Text('Login'),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: emailValidator,
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: passwordValidator,
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: WidgetStateProperty.all(const Size(150, 50)),
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                  ),
                  onPressed: () async {
                    // Add login logic here
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                          email: emailController.text,
                          password: passwordController.text));
                      var snackbar = const SnackBar(
                        /// need to set following properties for best effect of awesome_snackbar_content
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Congrats!',
                          message:
                              'you have successfully logged in to the chat app',

                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                          contentType: ContentType.success,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackbar);

                      Navigator.of(context).pushNamed(RoutesName.chat);
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          // Add navigation logic here
                          Navigator.of(context).pushNamed(RoutesName.register);
                        },
                        child: const Text('Register'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
