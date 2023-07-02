// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_exif_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PictureExifModel _$PictureExifModelFromJson(Map<String, dynamic> json) =>
    PictureExifModel(
      id: json['id'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      pictureUrls: PictureUrls.fromJson(json['urls'] as Map<String, dynamic>),
      pictureLinks:
          PictureLinks.fromJson(json['links'] as Map<String, dynamic>),
      exifModel: ExifModel.fromJson(json['exif'] as Map<String, dynamic>),
      likes: json['likes'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PictureExifModelToJson(PictureExifModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'urls': instance.pictureUrls,
      'user': instance.user,
      'links': instance.pictureLinks,
      'exif': instance.exifModel,
      'likes': instance.likes,
    };
