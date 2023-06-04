import 'package:json_annotation/json_annotation.dart';

part 'exif_model.g.dart';

@JsonSerializable()
class ExifModel {
  final String? make;
  final String? model;
  final String? name;
  @JsonKey(name: "exposure_time")
  final String? exposureTime;
  final String? aperture;
  @JsonKey(name: "focal_length")
  final String? focalLength;
  final String? iso;

  ExifModel({
    this.make,
    this.model,
    this.name,
    this.exposureTime,
    this.aperture,
    this.focalLength,
    this.iso,
  });

  factory ExifModel.fromJson(Map<String, dynamic> json) =>
      _$ExifModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExifModelToJson(this);
}
