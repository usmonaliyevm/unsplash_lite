import 'package:json_annotation/json_annotation.dart';

import '../picture/picture_model.dart';

part 'search_picture.g.dart';

@JsonSerializable()
class SearchPicture {
  final int total;
  @JsonKey(name: "total_pages")
  final int totalPages;
  final List<PictureModel> results;

  SearchPicture({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  factory SearchPicture.fromJson(Map<String, dynamic> json) =>
      _$SearchPictureFromJson(json);
  Map<String, dynamic> toJson() => _$SearchPictureToJson(this);
}
