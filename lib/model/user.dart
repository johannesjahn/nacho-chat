import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

class User {
  final int id;
  final String username;

  User({
    required this.id,
    required this.username,
  });

  factory User.fromResponse(UserListResponseEntry response) => User(
        id: response.id,
        username: response.username,
      );

  static List<User> fromResponseList(List<UserListResponseEntry> response) {
    return response.map((entry) => User.fromResponse(entry)).toList();
  }
}

@freezed
class UserListResponse with _$UserListResponse {
  const factory UserListResponse({
    required List<UserListResponseEntry> users,
  }) = _UserListResponse;

  factory UserListResponse.fromJson(List<dynamic> json) => UserListResponse(
      users: json.map((e) => UserListResponseEntry.fromJson(e)).toList());
}

@freezed
class UserListResponseEntry with _$UserListResponseEntry {
  const factory UserListResponseEntry({
    required int id,
    required String username,
  }) = _UserListResponseEntry;

  factory UserListResponseEntry.fromJson(Map<String, dynamic> json) =>
      _$UserListResponseEntryFromJson(json);
}
