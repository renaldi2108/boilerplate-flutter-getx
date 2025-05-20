part of 'user_controller.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.started() = _Started;

  const factory UserEvent.fetchUser() = _FetchUser;
}