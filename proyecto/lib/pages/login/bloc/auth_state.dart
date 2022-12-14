part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthMidWayState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthRoleState extends AuthState {}

class UnAuthState extends AuthState {}

class SignOutSuccessState extends AuthState {}

class AuthErrorState extends AuthState {}

class AuthAwaitingState extends AuthState {}

class AuthFingerprintWaitingState extends AuthState {}
