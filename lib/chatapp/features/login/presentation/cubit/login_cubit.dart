import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final Dio dio = Dio();

  Future<void> loign(String email, String password) async {
    emit(LoginLoading());
    try {
      final cradintioal = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => log(value.toString()));
      emit(LoginSucsess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        emit(LoginFailure(Message: e.code));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        emit(LoginFailure(Message: e.code));
      }
    }
  }

  // this override methode its for tracking what happend in our app and to track the states of our app
  @override
  void onChange(Change<LoginState> change) {
    print(change);
    super.onChange(change);
  }
}
