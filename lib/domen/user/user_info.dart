import 'package:json_annotation/json_annotation.dart';
import 'package:unsplash_lite/domen/profile_image.dart/profile_image.dart';

part 'user_info.g.dart';

@JsonSerializable()
class User {
  final String name;

  @JsonKey(name: "profile_image")
  final ProfileImage profileImage;

  User({
    required this.name,
    required this.profileImage,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
