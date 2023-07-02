import 'package:json_annotation/json_annotation.dart';

part 'picture_links.g.dart';

@JsonSerializable()
class PictureLinks {
  final String self;
  final String html;
  final String download;

  PictureLinks({
    required this.self,
    required this.html,
    required this.download,
  });

  factory PictureLinks.fromJson(Map<String, dynamic> json) =>
      _$PictureLinksFromJson(json);
  Map<String, dynamic> toJson() => _$PictureLinksToJson(this);
}
