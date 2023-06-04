import 'package:json_annotation/json_annotation.dart';

part 'picture_url.g.dart';

@JsonSerializable()
class PictureUrls {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;
  @JsonKey(name: "small_s3")
  final String smallS3;

  PictureUrls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  factory PictureUrls.fromJson(Map<String, dynamic> json) =>
      _$PictureUrlsFromJson(json);
  Map<String, dynamic> toJson() => _$PictureUrlsToJson(this);
}
