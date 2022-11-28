import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto/Repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository _authRepo = AuthRepository();
  AuthBloc() : super(AuthInitial()) {
    on<VerifyAuthEvent>(_authVerfication);
    on<GoogleAuthEvent>(_authUser);
    on<SignOutEvent>(_signOut);
    on<FingerEvent>(_localSing);
  }

  FutureOr<void> _authVerfication(
      VerifyAuthEvent event, Emitter<AuthState> emit) async {
    if (_authRepo.isAlreadyAuthenticated()) {
      emit(UnAuthState());
      await Future.delayed(Duration(seconds: 2));
      emit(AuthMidWayState());
    } else {
      emit(UnAuthState());
    }
  }

  FutureOr<void> _signOut(event, emit) async {
    await _authRepo.signOutGoogleUser();
    await _authRepo.signOutFirebaseUser();
    emit(SignOutSuccessState());
  }

  FutureOr<void> _authUser(event, emit) async {
    emit(AuthAwaitingState());
    try {
      await _authRepo.signInWithGoogle();
      String role = await _authRepo.getRole();
      print(role);
      if (role == 'null') {
        emit(AuthRoleState());
      } else {
        emit(AuthSuccessState());
      }
    } catch (e) {
      print("Error al autenticar: $e");
      emit(AuthErrorState());
    }
  }

  FutureOr<void> _localSing(FingerEvent event, Emitter<AuthState> emit) async {
    bool isAuthenticated = await _authRepo.authenticateWithBiometrics();
    if (isAuthenticated) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState());
    }
  }
}
