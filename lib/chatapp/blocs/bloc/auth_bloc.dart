import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());

        try {
          final cradintioal = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password)
              .then((value) => log(value.toString()));
          emit(LoginSucsess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
            emit(LoginFailure(message: e.code));
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
            emit(LoginFailure(message: e.code));
          }
        }
      }
    });
  }
  // this override its for tracking what happend when any avent occurs and tracking states in our app
  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    print(transition);
    super.onTransition(transition);
  }
}
