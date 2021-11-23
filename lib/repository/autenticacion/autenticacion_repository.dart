import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

import 'models/user.dart';

// ! Cuando ocurre un error al registrarse
class SingUpFailure implements Exception {
  final String message;

  SingUpFailure(this.message);

  @override
  String toString() => 'SingUpFailure { message: $message }';
}

// ! Cuando ocurre un error al iniciar sesion
class LogInWithEmailAndPasswordFailure implements Exception {
  final String message;

  LogInWithEmailAndPasswordFailure(this.message);

  @override
  String toString() => 'LogInWithEmailAndPasswordFailure { message: $message }';
}

// ! Cuando ocurre un error con el inicio de sesion de google
class LogInWithGoogleFailure implements Exception {
  final String message;

  LogInWithGoogleFailure(this.message);

  @override
  String toString() => 'LogInWithGoogleFailure { message: $message }';
}

// ! Cuando ocurre un error al cerrar sesion
class LogOutFailure implements Exception {
  final String message;

  LogOutFailure(this.message);

  @override
  String toString() => 'LogOutFailure { message: $message }';
}

class AuthenticationRepository {
  AuthenticationRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  // ! stream User -> actual usuario cuando el estado del autenticado cambia
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? User.empty : firebaseUser.toUser;
    });
  }

  // ! Crear usuario con email y password
  Future<void> singUp({
    required String email,
    required String password,
    required String name,
  }) async {
    assert(email != null && password != null && name != null);
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email,password: password,);
    } on Exception{
      throw SingUpFailure('hola');
    }
  }

  // ! login con google
  // ! login con email y password
  // ! cerrar sesion

}

extension on firebase_auth.User {
  User get toUser {
    return User(
      id: uid,
      name: '',
      email: '',
      password: '',
    );
  }
}
