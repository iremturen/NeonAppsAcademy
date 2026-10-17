import 'package:connectly/app/common/constants/app_errors.dart';
import 'package:connectly/app/data/datasources/remote/user_remote_data_source.dart';
import 'package:connectly/app/data/models/remote_user_model.dart';
import 'package:connectly/app/presentation/models/users_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UsersState> {
  final UserRemoteDataSource _userRemoteDataSource;

  UsersCubit(this._userRemoteDataSource) : super(const UsersInitial());

  String _getErrorMessage(Object error) {
    if (error is! DioException) {
      return AppErrors.networkError;
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return AppErrors.connectionTimeout;

      case DioExceptionType.sendTimeout:
        return AppErrors.sendTimeout;

      case DioExceptionType.receiveTimeout:
        return AppErrors.receiveTimeout;

      case DioExceptionType.connectionError:
        return AppErrors.noInternetConnection;

      case DioExceptionType.badResponse:
        return AppErrors.serverError;

      default:
        return AppErrors.networkError;
    }
  }

  Future<void> getUsers() async {
    emit(const UsersLoading());

    try {
      final users = await _userRemoteDataSource.getUsers();

      emit(UsersLoaded(users));
    } catch (e) {
      emit(UsersError(_getErrorMessage(e)));
    }
  }

  Future<bool> addUser(RemoteUserModel user) async {
    if (state is! UsersLoaded) return false;

    final currentUsers = (state as UsersLoaded).users;

    emit(UsersLoaded(currentUsers, isAdding: true));

    try {
      final newUser = await _userRemoteDataSource.addUser(user);

      emit(UsersLoaded([...currentUsers, newUser]));

      return true;
    } catch (e) {
      emit(UsersLoaded(currentUsers));
      return false;
    }
  }
}
