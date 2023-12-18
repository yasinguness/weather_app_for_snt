import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_for_snt/network/model/base/base_model.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends BaseModel {
  @JsonKey(name: "latitude")
  double? latitude;
  @JsonKey(name: "longitude")
  double? longitude;
  @JsonKey(name: "generationtime_ms")
  double? generationtimeMs;
  @JsonKey(name: "utc_offset_seconds")
  int? utcOffsetSeconds;
  @JsonKey(name: "timezone")
  String? timezone;
  @JsonKey(name: "timezone_abbreviation")
  String? timezoneAbbreviation;
  @JsonKey(name: "elevation")
  int? elevation;
  @JsonKey(name: "hourly_units")
  HourlyUnits? hourlyUnits;
  @JsonKey(name: "hourly")
  Hourly? hourly;

  WeatherModel({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.hourlyUnits,
    this.hourly,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
}

@JsonSerializable()
class Hourly extends BaseModel {
  @JsonKey(name: "time")
  List<String>? time;
  @JsonKey(name: "temperature_2m")
  List<double>? temperature2M;

  Hourly({
    this.time,
    this.temperature2M,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$HourlyToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
}

@JsonSerializable()
class HourlyUnits extends BaseModel {
  @JsonKey(name: "time")
  String? time;
  @JsonKey(name: "temperature_2m")
  String? temperature2M;

  HourlyUnits({
    this.time,
    this.temperature2M,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) => _$HourlyUnitsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$HourlyUnitsToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
}
