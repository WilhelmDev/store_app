import 'package:store_app/models/user.dart';
import 'package:store_app/models/api_response.dart';
import 'package:store_app/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepository {
  final String baseUrl = Config.apiUrl;

  Future<User> signIn(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final ApiResponse<User> apiResponse = ApiResponse<User>.fromJson(
          responseData,
          (data) => userFromJson(json.encode(data)),
        );

        if (apiResponse.success) {
          return apiResponse.data;
        } else {
          throw Exception('Login failed: ${responseData['message']}');
        }
      } else {
        throw Exception('Failed to sign in: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error connecting to the server: $e');
    }
  }
}