// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PictureUrls _$PictureUrlsFromJson(Map<String, dynamic> json) => PictureUrls(
      raw: json['raw'] as String,
      full: json['full'] as String,
      regular: json['regular'] as String,
      small: json['small'] as String,
      thumb: json['thumb'] as String,
      smallS3: json['small_s3'] as String,
    );

Map<String, dynamic> _$PictureUrlsToJson(PictureUrls instance) =>
    <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'regular': instance.regular,
      'small': instance.small,
      'thumb': instance.thumb,
      'small_s3': instance.smallS3,
    };
