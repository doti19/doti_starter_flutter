import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/infrastructure/dio_extensions.dart';
import '../../core/infrastructure/exceptions.dart';
import 'auth_response.dart';

abstract class IAuthRemoteService {
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  });

  Future<AuthResponse> generateOTP({
    required String email,
  });

  Future<AuthResponse> verifyOTP({
    required String email,
    required String otp,
  });

  Future<AuthResponse> forgetPassword({
    required String email,
  });

  Future<AuthResponse> register({
    required String email,
    required String password,
    required String otp,
    required String firstName,
    required String lastName,
    required String role,
    required String phoneNumber,
    required String phoneNumberCountryCode,
    required String dateOfBirth,
    required String placeOfBirth,
    required String gender,
    required String streetAddress,
    String? streetAddress2,
    required String city,
    required String state,
    required String country,
    required String zipCode,
  });

  Future<void> signOut();
}

@LazySingleton(as: IAuthRemoteService)
class AuthRemoteService implements IAuthRemoteService {
  AuthRemoteService(this._dio);

  final Dio _dio;

  @override
  Future<void> signOut() async {
    try {
      await _dio.get<dynamic>('auth/logout');
    } on DioException catch (e) {
      if (e.isNoConnectionError || e.isConnectionTimeout) {
        throw NoConnectionException();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<AuthResponse> generateOTP({
    required String email,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        'auth/generateotp',
        data: {
          'email': email,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return const AuthResponse.success();
      } else {
        final message = response.data?['message'] as String?;
        return AuthResponse.failure(
          errorCode: response.statusCode,
          message: message,
        );
      }
    } on DioException catch (e) {
      if (e.isNoConnectionError || e.isConnectionTimeout) {
        return const AuthResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        throw RestApiException(e.response?.statusCode);
      }
    }
  }

  @override
  Future<AuthResponse> forgetPassword({
    required String email,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        'auth/requestresetpassword',
        data: {
          'email': email,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return const AuthResponse.success();
      } else {
        final message = response.data?['message'] as String?;
        return AuthResponse.failure(
          errorCode: response.statusCode,
          message: message,
        );
      }
    } on DioException catch (e) {
      if (e.isNoConnectionError || e.isConnectionTimeout) {
        return const AuthResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        throw RestApiException(e.response?.statusCode);
      }
    }
  }

  @override
  Future<AuthResponse> verifyOTP({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        'auth/verifyotp',
        data: {
          'email': email,
          'otp': otp,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return const AuthResponse.success();
      } else {
        final message = response.data?['message'] as String?;
        return AuthResponse.failure(
          errorCode: response.statusCode,
          message: message,
        );
      }
    } on DioException catch (e) {
      if (e.isNoConnectionError || e.isConnectionTimeout) {
        return const AuthResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        throw RestApiException(e.response?.statusCode);
      }
    }
  }

  @override
  Future<AuthResponse> register({
    required String email,
    required String password,
    required String otp,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String phoneNumberCountryCode,
    required String dateOfBirth,
    required String placeOfBirth,
    required String role,
    required String gender,
    required String streetAddress,
    String? streetAddress2,
    required String city,
    required String state,
    required String country,
    required String zipCode,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        'auth/register',
        data: {
          'email': email.toLowerCase(),
          'password': password,
          'otp': otp,
          'role': role.toLowerCase(),
          'firstName': firstName,
          'lastName': lastName,
          'phoneNumber': phoneNumber,
          'phoneNumberCountryCode': phoneNumberCountryCode,
          'dateOfBirth': dateOfBirth,
          'gender': gender.toLowerCase(),
          'streetAddress': streetAddress,
          'streetAddress2': streetAddress2,
          'city': city,
          'stateProvince': state,
          'country': country,
          'zipCode': zipCode,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final user = response.data?['user'] as Map<String, dynamic>?;
        print(response.statusCode);
        if (user != null) {
          return AuthResponse.withData(user);
        } else {
          return const AuthResponse.failure(
            errorCode: 404,
            message: 'User not found',
          );
        }
      } else {
        final message = response.data?['message'] as String?;
        return AuthResponse.failure(
          errorCode: response.statusCode,
          message: message,
        );
      }
    } on DioException catch (e) {
      if (e.isNoConnectionError || e.isConnectionTimeout) {
        return const AuthResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        throw RestApiException(e.response?.statusCode);
      }
    }
  }

  @override
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        'auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = response.data?['tokens']['accessToken'] as String?;

        if (token != null) {
          return AuthResponse.withToken(token);
        } else {
          return const AuthResponse.failure(
            errorCode: 404,
            message: 'Credential token not found',
          );
        }
      } else {
        final message = response.data?['message'] as String?;
        return AuthResponse.failure(
          errorCode: response.statusCode,
          message: message,
        );
      }
    } on DioException catch (e) {
      if (e.isNoConnectionError || e.isConnectionTimeout) {
        return const AuthResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        throw RestApiException(e.response?.statusCode);
      }
    }
  }
}
