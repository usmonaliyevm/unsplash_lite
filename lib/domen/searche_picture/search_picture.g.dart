// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPicture _$SearchPictureFromJson(Map<String, dynamic> json) =>
    SearchPicture(
      total: json['total'] as int,
      totalPages: json['total_pages'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => PictureModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchPictureToJson(SearchPicture instance) =>
    <String, dynamic>{
      'total': instance.total,
      'total_pages': instance.totalPages,
      'results': instance.results,
    };
