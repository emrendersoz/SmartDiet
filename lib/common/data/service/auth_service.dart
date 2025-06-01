// ignore_for_file: only_throw_errors

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService._init();
  static final AuthService _instance = AuthService._init();
  static AuthService get instance => _instance;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw FirebaseException(
          plugin: 'FirebaseAuth',
          code: 'weak-password',
          message: 'Zayıf şifre.',
        );
      } else if (e.code == 'email-already-in-use') {
        throw FirebaseException(
          plugin: 'FirebaseAuth',
          code: 'email-already-in-use',
          message: 'Email zaten kullanımda.',
        );
      }
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw FirebaseException(
          plugin: 'FirebaseAuth',
          code: 'invalid-email',
          message: 'Geçersiz email adresi.',
        );
      } else if (e.code == 'user-not-found') {
        throw FirebaseException(
          plugin: 'FirebaseAuth',
          code: 'user-not-found',
          message: 'Kullanıcı bulunamadı.',
        );
      }
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw FirebaseException(
          plugin: 'FirebaseAuth',
          code: 'user-not-found',
          message: 'Kullanıcı bulunamadı.',
        );
      } else if (e.code == 'wrong-password') {
        throw FirebaseException(
          plugin: 'FirebaseAuth',
          code: 'wrong-password',
          message: 'Yanlış şifre.',
        );
      } else if (e.code == 'invalid-email') {
        throw FirebaseException(
          plugin: 'FirebaseAuth',
          code: 'invalid-email',
          message: 'Geçersiz email adresi.',
        );
      }
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> logout() async {
    return await _firebaseAuth.signOut();
  }

  String? get userId => currentUser?.uid;
  User? get currentUser => _firebaseAuth.currentUser;
}
