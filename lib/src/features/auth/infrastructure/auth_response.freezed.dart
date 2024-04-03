// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthResponse {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) withToken,
    required TResult Function(Map<String, dynamic> data) withData,
    required TResult Function() noConnection,
    required TResult Function() success,
    required TResult Function(int? errorCode, String? message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String token)? withToken,
    TResult? Function(Map<String, dynamic> data)? withData,
    TResult? Function()? noConnection,
    TResult? Function()? success,
    TResult? Function(int? errorCode, String? message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? withToken,
    TResult Function(Map<String, dynamic> data)? withData,
    TResult Function()? noConnection,
    TResult Function()? success,
    TResult Function(int? errorCode, String? message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WithToken value) withToken,
    required TResult Function(_WithData value) withData,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WithToken value)? withToken,
    TResult? Function(_WithData value)? withData,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WithToken value)? withToken,
    TResult Function(_WithData value)? withData,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseCopyWith<$Res> {
  factory $AuthResponseCopyWith(
          AuthResponse value, $Res Function(AuthResponse) then) =
      _$AuthResponseCopyWithImpl<$Res, AuthResponse>;
}

/// @nodoc
class _$AuthResponseCopyWithImpl<$Res, $Val extends AuthResponse>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WithTokenImplCopyWith<$Res> {
  factory _$$WithTokenImplCopyWith(
          _$WithTokenImpl value, $Res Function(_$WithTokenImpl) then) =
      __$$WithTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$WithTokenImplCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$WithTokenImpl>
    implements _$$WithTokenImplCopyWith<$Res> {
  __$$WithTokenImplCopyWithImpl(
      _$WithTokenImpl _value, $Res Function(_$WithTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$WithTokenImpl(
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WithTokenImpl extends _WithToken {
  const _$WithTokenImpl(this.token) : super._();

  @override
  final String token;

  @override
  String toString() {
    return 'AuthResponse.withToken(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithTokenImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WithTokenImplCopyWith<_$WithTokenImpl> get copyWith =>
      __$$WithTokenImplCopyWithImpl<_$WithTokenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) withToken,
    required TResult Function(Map<String, dynamic> data) withData,
    required TResult Function() noConnection,
    required TResult Function() success,
    required TResult Function(int? errorCode, String? message) failure,
  }) {
    return withToken(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String token)? withToken,
    TResult? Function(Map<String, dynamic> data)? withData,
    TResult? Function()? noConnection,
    TResult? Function()? success,
    TResult? Function(int? errorCode, String? message)? failure,
  }) {
    return withToken?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? withToken,
    TResult Function(Map<String, dynamic> data)? withData,
    TResult Function()? noConnection,
    TResult Function()? success,
    TResult Function(int? errorCode, String? message)? failure,
    required TResult orElse(),
  }) {
    if (withToken != null) {
      return withToken(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WithToken value) withToken,
    required TResult Function(_WithData value) withData,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return withToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WithToken value)? withToken,
    TResult? Function(_WithData value)? withData,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return withToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WithToken value)? withToken,
    TResult Function(_WithData value)? withData,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (withToken != null) {
      return withToken(this);
    }
    return orElse();
  }
}

abstract class _WithToken extends AuthResponse {
  const factory _WithToken(final String token) = _$WithTokenImpl;
  const _WithToken._() : super._();

  String get token;
  @JsonKey(ignore: true)
  _$$WithTokenImplCopyWith<_$WithTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WithDataImplCopyWith<$Res> {
  factory _$$WithDataImplCopyWith(
          _$WithDataImpl value, $Res Function(_$WithDataImpl) then) =
      __$$WithDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$WithDataImplCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$WithDataImpl>
    implements _$$WithDataImplCopyWith<$Res> {
  __$$WithDataImplCopyWithImpl(
      _$WithDataImpl _value, $Res Function(_$WithDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$WithDataImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$WithDataImpl extends _WithData {
  const _$WithDataImpl(final Map<String, dynamic> data)
      : _data = data,
        super._();

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'AuthResponse.withData(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithDataImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WithDataImplCopyWith<_$WithDataImpl> get copyWith =>
      __$$WithDataImplCopyWithImpl<_$WithDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) withToken,
    required TResult Function(Map<String, dynamic> data) withData,
    required TResult Function() noConnection,
    required TResult Function() success,
    required TResult Function(int? errorCode, String? message) failure,
  }) {
    return withData(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String token)? withToken,
    TResult? Function(Map<String, dynamic> data)? withData,
    TResult? Function()? noConnection,
    TResult? Function()? success,
    TResult? Function(int? errorCode, String? message)? failure,
  }) {
    return withData?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? withToken,
    TResult Function(Map<String, dynamic> data)? withData,
    TResult Function()? noConnection,
    TResult Function()? success,
    TResult Function(int? errorCode, String? message)? failure,
    required TResult orElse(),
  }) {
    if (withData != null) {
      return withData(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WithToken value) withToken,
    required TResult Function(_WithData value) withData,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return withData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WithToken value)? withToken,
    TResult? Function(_WithData value)? withData,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return withData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WithToken value)? withToken,
    TResult Function(_WithData value)? withData,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (withData != null) {
      return withData(this);
    }
    return orElse();
  }
}

abstract class _WithData extends AuthResponse {
  const factory _WithData(final Map<String, dynamic> data) = _$WithDataImpl;
  const _WithData._() : super._();

  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$WithDataImplCopyWith<_$WithDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoConnectionImplCopyWith<$Res> {
  factory _$$NoConnectionImplCopyWith(
          _$NoConnectionImpl value, $Res Function(_$NoConnectionImpl) then) =
      __$$NoConnectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoConnectionImplCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$NoConnectionImpl>
    implements _$$NoConnectionImplCopyWith<$Res> {
  __$$NoConnectionImplCopyWithImpl(
      _$NoConnectionImpl _value, $Res Function(_$NoConnectionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoConnectionImpl extends _NoConnection {
  const _$NoConnectionImpl() : super._();

  @override
  String toString() {
    return 'AuthResponse.noConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoConnectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) withToken,
    required TResult Function(Map<String, dynamic> data) withData,
    required TResult Function() noConnection,
    required TResult Function() success,
    required TResult Function(int? errorCode, String? message) failure,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String token)? withToken,
    TResult? Function(Map<String, dynamic> data)? withData,
    TResult? Function()? noConnection,
    TResult? Function()? success,
    TResult? Function(int? errorCode, String? message)? failure,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? withToken,
    TResult Function(Map<String, dynamic> data)? withData,
    TResult Function()? noConnection,
    TResult Function()? success,
    TResult Function(int? errorCode, String? message)? failure,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WithToken value) withToken,
    required TResult Function(_WithData value) withData,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WithToken value)? withToken,
    TResult? Function(_WithData value)? withData,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WithToken value)? withToken,
    TResult Function(_WithData value)? withData,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class _NoConnection extends AuthResponse {
  const factory _NoConnection() = _$NoConnectionImpl;
  const _NoConnection._() : super._();
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl extends _Success {
  const _$SuccessImpl() : super._();

  @override
  String toString() {
    return 'AuthResponse.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) withToken,
    required TResult Function(Map<String, dynamic> data) withData,
    required TResult Function() noConnection,
    required TResult Function() success,
    required TResult Function(int? errorCode, String? message) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String token)? withToken,
    TResult? Function(Map<String, dynamic> data)? withData,
    TResult? Function()? noConnection,
    TResult? Function()? success,
    TResult? Function(int? errorCode, String? message)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? withToken,
    TResult Function(Map<String, dynamic> data)? withData,
    TResult Function()? noConnection,
    TResult Function()? success,
    TResult Function(int? errorCode, String? message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WithToken value) withToken,
    required TResult Function(_WithData value) withData,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WithToken value)? withToken,
    TResult? Function(_WithData value)? withData,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WithToken value)? withToken,
    TResult Function(_WithData value)? withData,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success extends AuthResponse {
  const factory _Success() = _$SuccessImpl;
  const _Success._() : super._();
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? errorCode, String? message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorCode = freezed,
    Object? message = freezed,
  }) {
    return _then(_$FailureImpl(
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FailureImpl extends _Failure {
  const _$FailureImpl({this.errorCode, this.message}) : super._();

  @override
  final int? errorCode;
  @override
  final String? message;

  @override
  String toString() {
    return 'AuthResponse.failure(errorCode: $errorCode, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorCode, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) withToken,
    required TResult Function(Map<String, dynamic> data) withData,
    required TResult Function() noConnection,
    required TResult Function() success,
    required TResult Function(int? errorCode, String? message) failure,
  }) {
    return failure(errorCode, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String token)? withToken,
    TResult? Function(Map<String, dynamic> data)? withData,
    TResult? Function()? noConnection,
    TResult? Function()? success,
    TResult? Function(int? errorCode, String? message)? failure,
  }) {
    return failure?.call(errorCode, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? withToken,
    TResult Function(Map<String, dynamic> data)? withData,
    TResult Function()? noConnection,
    TResult Function()? success,
    TResult Function(int? errorCode, String? message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorCode, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WithToken value) withToken,
    required TResult Function(_WithData value) withData,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WithToken value)? withToken,
    TResult? Function(_WithData value)? withData,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WithToken value)? withToken,
    TResult Function(_WithData value)? withData,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure extends AuthResponse {
  const factory _Failure({final int? errorCode, final String? message}) =
      _$FailureImpl;
  const _Failure._() : super._();

  int? get errorCode;
  String? get message;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
