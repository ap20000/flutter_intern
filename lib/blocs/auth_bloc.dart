import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String? _registeredEmail;
  String? _registeredPassword;

  AuthBloc() : super(AuthInitial()) {
    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 1));
      _registeredEmail = event.email;
      _registeredPassword = event.password;
      emit(AuthSuccess());
    });

    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 1));

      if (event.email == _registeredEmail &&
          event.password == _registeredPassword) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Invalid credentials"));
      }
    });
  }
}
