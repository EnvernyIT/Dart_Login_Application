class UserModel {
  late final String? emId;
  late final String? emCode;
  late final String? username;
  late final String? firstName;
  late final String? lastName;
  late final String? role;

  UserModel(
    String? emId,
    String? emCode,
    String? username,
    String? firstName,
    String? lastName,
    String? role,
  ) {
    this.emId = emId;
    this.emCode = emCode;
    this.username = username;
    this.firstName = firstName;
    this.lastName = lastName;
    this.role = role;
  }
}

class UserRoleModel {
  final String? roleName;

  UserRoleModel(
    String? roles, {
    this.roleName,
  });
}

class LoggedInUser {
  static bool loggedIn = false;

  static UserModel? loggedInUser;

  static UserRoleModel? role;

  LoggedInUser(bool loggedIn, UserModel loggedInUser, UserRoleModel role) {
    LoggedInUser.loggedIn = loggedIn;
    LoggedInUser.loggedInUser = loggedInUser;
    LoggedInUser.role = role;
  }

  static Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'firstName': loggedInUser?.firstName?.toString(),
      'lastName': loggedInUser?.lastName?.toString(),
    };
    return map;
  }
}
