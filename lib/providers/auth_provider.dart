import 'package:flutter/foundation.dart';
import 'package:store_app/models/user.dart';
import 'package:store_app/repositories/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;

  final AuthRepository _authRepository = AuthRepository();

  Future<void> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await _authRepository.signIn(email, password);
      // Aquí podrías guardar el token en el almacenamiento local
    } catch (e) {
      _user = null;
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void signOut() {
    _user = null;
    // Aquí podrías eliminar el token del almacenamiento local
    notifyListeners();
  }
}