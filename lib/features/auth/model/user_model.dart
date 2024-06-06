import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String disPlayName;
  final String? userName;
  final String? email;
  final String profilePic;
  final List<String>? subscriptions;
  final int? videos;
  final String? userId;
  final String? description;
  final String? type;

  UserModel({
    required this.disPlayName,
    this.userName,
    required this.email,
    required this.profilePic,
    this.subscriptions,
    this.videos,
    this.userId,
    this.description,
    this.type,
  });

  //  FromJson
  factory UserModel.fromJson(Map<String, dynamic> map) =>
      _$UserModelFromJson(map);

  //ToJson

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}


// void main() {
//   // Example usage:
//   String jsonString = '{"disPlayName": "John Doe", "userName": "john_doe", "email": "john@example.com", "profilePic": "pic_url", "subscriptions": ["sub1", "sub2"], "videos": 10, "userId": "12345", "description": "Sample description", "type": "admin"}';

//   // Decode JSON to UserModel
//   Map<String, dynamic> userMap = json.decode(jsonString);
//   UserModel user = UserModel.fromJson(userMap);

//   print('DisplayName: ${user.disPlayName}'); // Output: DisplayName: John Doe

//   // Encode UserModel to JSON
//   String encodedJson = json.encode(user.toJson());
//   print('Encoded JSON: $encodedJson');
// }
