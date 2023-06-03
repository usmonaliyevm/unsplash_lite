// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PictureModel _$PictureModelFromJson(Map<String, dynamic> json) => PictureModel(
      id: json['id'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      pictureUrls: PictureUrls.fromJson(json['urls'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PictureModelToJson(PictureModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'urls': instance.pictureUrls,
    };
