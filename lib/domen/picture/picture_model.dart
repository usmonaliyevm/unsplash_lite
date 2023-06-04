import 'package:unsplash_lite/domen/picture_urls/picture_url.dart';
import 'package:json_annotation/json_annotation.dart';

part 'picture_model.g.dart';

@JsonSerializable()
class PictureModel {
  final String id;
  final int width;
  final int height;
  @JsonKey(name: "urls")
  final PictureUrls pictureUrls;

  PictureModel({
    required this.id,
    required this.width,
    required this.height,
    required this.pictureUrls,
  });

  factory PictureModel.fromJson(Map<String, dynamic> json) =>
      _$PictureModelFromJson(json);
  Map<String, dynamic> toJson() => _$PictureModelToJson(this);
}
