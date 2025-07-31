import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Получить текущего пользователя
  User? get currentUser {
    debugPrint('[AuthService] Текущий пользователь: ${_auth.currentUser?.email}');
    return _auth.currentUser;
  }

  // Поток аутентификации (для StreamBuilder, например)
  Stream<User?> get authStateChanges {
    debugPrint('[AuthService] Подписка на изменения аутентификации');
    return _auth.authStateChanges();
  }

  // Вход по email и паролю
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    debugPrint('[AuthService] Попытка входа: $email');
    try {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      debugPrint('[AuthService] Успешный вход: ${result.user?.email}');
      return result.user;
    } catch (e) {
      debugPrint('[AuthService] Ошибка входа: $e');
      rethrow;
    }
  }

  // Регистрация
  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    debugPrint('[AuthService] Попытка регистрации: $email');
    try {
      final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      debugPrint('[AuthService] Успешная регистрация: ${result.user?.email}');
      return result.user;
    } catch (e) {
      debugPrint('[AuthService] Ошибка регистрации: $e');
      rethrow;
    }
  }

  // Выход
  Future<void> signOut() async {
    debugPrint('[AuthService] Выход пользователя: ${_auth.currentUser?.email}');
    try {
      await _auth.signOut();
      debugPrint('[AuthService] Пользователь вышел');
    } catch (e) {
      debugPrint('[AuthService] Ошибка выхода: $e');
      rethrow;
    }
  }
}
