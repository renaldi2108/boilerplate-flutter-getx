import 'package:boilerplate/domain/entity/user/user_entity.dart';
import 'package:boilerplate/domain/usecase/user/user_usecase.dart';
import 'package:boilerplate/shared/core/base/controller.dart';
import 'package:boilerplate/shared/core/base/state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

part 'user_event.dart';
part 'generated/user_controller.freezed.dart';

@injectable
class UserController extends BaseController<UserEvent> {
  final UserUsecase _usecase;
  final Rx<BaseState<List<UserEntity>>> userState = Rx<BaseState<List<UserEntity>>>(
      BaseState.initial()
  );

  UserController(this._usecase);

  @override
  void onEvent(UserEvent event) async {
    await event.map(
      started: (_Started value) {  },
      fetchUser: (_FetchUser value) => _fetchUser(value)
    );
  }

  Future<void> _fetchUser(_FetchUser value) async {
    userState.value = BaseState.loading();

    final fetch = await _usecase.call("");
    userState.value = fetch.fold(
          (failure) => BaseState.error(failure.failure as String),
          (result) => BaseState.success(result),
    );
  }
}