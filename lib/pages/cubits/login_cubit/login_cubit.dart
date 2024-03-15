import 'package:chat_app/pages/cubits/login_cubit/login_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(super.initialState);

  Future<void> loginUser(
      {required String email, required String password}) async {
    // ignore: unused_local_variable
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on Exception catch (e) {
      emit(LoginFailure());
    }
  }
}