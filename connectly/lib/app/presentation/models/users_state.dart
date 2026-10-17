import 'package:connectly/app/data/models/remote_user_model.dart';

abstract class UsersState {
  const UsersState();
}

class UsersInitial extends UsersState {
  const UsersInitial();
}

class UsersLoading extends UsersState {
  const UsersLoading();
}

class UsersLoaded extends UsersState {
  final List<RemoteUserModel> users;
  final bool isAdding;

  const UsersLoaded(this.users, {this.isAdding = false});
}

class UsersError extends UsersState {
  final String message;

  const UsersError(this.message);
}
