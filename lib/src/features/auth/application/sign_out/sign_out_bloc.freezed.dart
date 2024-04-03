// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_out_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignOutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignedOut value) signedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignedOut value)? signedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignedOut value)? signedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignOutEventCopyWith<$Res> {
  factory $SignOutEventCopyWith(
          SignOutEvent value, $Res Function(SignOutEvent) then) =
      _$SignOutEventCopyWithImpl<$Res, SignOutEvent>;
}

/// @nodoc
class _$SignOutEventCopyWithImpl<$Res, $Val extends SignOutEvent>
    implements $SignOutEventCopyWith<$Res> {
  _$SignOutEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SignedOutImplCopyWith<$Res> {
  factory _$$SignedOutImplCopyWith(
          _$SignedOutImpl value, $Res Function(_$SignedOutImpl) then) =
      __$$SignedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignedOutImplCopyWithImpl<$Res>
    extends _$SignOutEventCopyWithImpl<$Res, _$SignedOutImpl>
    implements _$$SignedOutImplCopyWith<$Res> {
  __$$SignedOutImplCopyWithImpl(
      _$SignedOutImpl _value, $Res Function(_$SignedOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignedOutImpl implements _SignedOut {
  const _$SignedOutImpl();

  @override
  String toString() {
    return 'SignOutEvent.signedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignedOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signedOut,
  }) {
    return signedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signedOut,
  }) {
    return signedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signedOut,
    required TResult orElse(),
  }) {
    if (signedOut != null) {
      return signedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignedOut value) signedOut,
  }) {
    return signedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignedOut value)? signedOut,
  }) {
    return signedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignedOut value)? signedOut,
    required TResult orElse(),
  }) {
    if (signedOut != null) {
      return signedOut(this);
    }
    return orElse();
  }
}

abstract class _SignedOut implements SignOutEvent {
  const factory _SignedOut() = _$SignedOutImpl;
}

/// @nodoc
mixin _$SignOutState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get signOutFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignOutStateCopyWith<SignOutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignOutStateCopyWith<$Res> {
  factory $SignOutStateCopyWith(
          SignOutState value, $Res Function(SignOutState) then) =
      _$SignOutStateCopyWithImpl<$Res, SignOutState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<AuthFailure, Unit>> signOutFailureOrSuccessOption});
}

/// @nodoc
class _$SignOutStateCopyWithImpl<$Res, $Val extends SignOutState>
    implements $SignOutStateCopyWith<$Res> {
  _$SignOutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? signOutFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      signOutFailureOrSuccessOption: null == signOutFailureOrSuccessOption
          ? _value.signOutFailureOrSuccessOption
          : signOutFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignOutStateImplCopyWith<$Res>
    implements $SignOutStateCopyWith<$Res> {
  factory _$$SignOutStateImplCopyWith(
          _$SignOutStateImpl value, $Res Function(_$SignOutStateImpl) then) =
      __$$SignOutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<AuthFailure, Unit>> signOutFailureOrSuccessOption});
}

/// @nodoc
class __$$SignOutStateImplCopyWithImpl<$Res>
    extends _$SignOutStateCopyWithImpl<$Res, _$SignOutStateImpl>
    implements _$$SignOutStateImplCopyWith<$Res> {
  __$$SignOutStateImplCopyWithImpl(
      _$SignOutStateImpl _value, $Res Function(_$SignOutStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? signOutFailureOrSuccessOption = null,
  }) {
    return _then(_$SignOutStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      signOutFailureOrSuccessOption: null == signOutFailureOrSuccessOption
          ? _value.signOutFailureOrSuccessOption
          : signOutFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$SignOutStateImpl implements _SignOutState {
  const _$SignOutStateImpl(
      {required this.isLoading, required this.signOutFailureOrSuccessOption});

  @override
  final bool isLoading;
  @override
  final Option<Either<AuthFailure, Unit>> signOutFailureOrSuccessOption;

  @override
  String toString() {
    return 'SignOutState(isLoading: $isLoading, signOutFailureOrSuccessOption: $signOutFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignOutStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.signOutFailureOrSuccessOption,
                    signOutFailureOrSuccessOption) ||
                other.signOutFailureOrSuccessOption ==
                    signOutFailureOrSuccessOption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, signOutFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignOutStateImplCopyWith<_$SignOutStateImpl> get copyWith =>
      __$$SignOutStateImplCopyWithImpl<_$SignOutStateImpl>(this, _$identity);
}

abstract class _SignOutState implements SignOutState {
  const factory _SignOutState(
      {required final bool isLoading,
      required final Option<Either<AuthFailure, Unit>>
          signOutFailureOrSuccessOption}) = _$SignOutStateImpl;

  @override
  bool get isLoading;
  @override
  Option<Either<AuthFailure, Unit>> get signOutFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$SignOutStateImplCopyWith<_$SignOutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
