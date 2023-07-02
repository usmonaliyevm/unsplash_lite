import 'package:unsplash_lite/domen/exif/exif_model.dart';
import 'package:unsplash_lite/domen/links/picture_links.dart';
import 'package:unsplash_lite/domen/picture_urls/picture_url.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unsplash_lite/domen/user/user_info.dart';

part 'picture_exif_model.g.dart';

@JsonSerializable()
class PictureExifModel {
  final String id;
  final int width;
  final int height;
  @JsonKey(name: "urls")
  final PictureUrls pictureUrls;
  final User user;

  @JsonKey(name: "links")
  final PictureLinks pictureLinks;
  final int likes;

  @JsonKey(name: "exif")
  final ExifModel exifModel;

  PictureExifModel({
    required this.id,
    required this.width,
    required this.height,
    required this.pictureUrls,
    required this.pictureLinks,
    required this.exifModel,
    required this.likes,
    required this.user,
  });
  factory PictureExifModel.fromJson(Map<String, dynamic> json) =>
      _$PictureExifModelFromJson(json);

  Map<String, dynamic> toJson() => _$PictureExifModelToJson(this);
}
