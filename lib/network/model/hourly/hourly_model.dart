import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_for_snt/network/model/base/base_model.dart';

part 'hourly_model.g.dart';

@JsonSerializable()
class HourlyModel extends BaseModel<HourlyModel> {
  HourlyModel({
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

  factory HourlyModel.fromJson(Map<String, dynamic> json) => _$HourlyModelFromJson(json);
  @JsonKey(name: 'latitude')
  double? latitude;
  @JsonKey(name: 'longitude')
  double? longitude;
  @JsonKey(name: 'generationtime_ms')
  double? generationtimeMs;
  @JsonKey(name: 'utc_offset_seconds')
  int? utcOffsetSeconds;
  @JsonKey(name: 'timezone')
  String? timezone;
  @JsonKey(name: 'timezone_abbreviation')
  String? timezoneAbbreviation;
  @JsonKey(name: 'elevation')
  double? elevation;
  @JsonKey(name: 'hourly_units')
  HourlyUnits? hourlyUnits;
  @JsonKey(name: 'hourly')
  Hourly? hourly;

  @override
  Map<String, dynamic> toJson() => _$HourlyModelToJson(this);

  @override
  HourlyModel fromJson(Map<String, dynamic> json) => _$HourlyModelFromJson(json);
}

@JsonSerializable()
class Hourly extends BaseModel<Hourly> {
  Hourly({
    this.time,
    this.temperature2M,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
  @JsonKey(name: 'time')
  List<String>? time;
  @JsonKey(name: 'temperature_2m')
  List<double>? temperature2M;

  @override
  Map<String, dynamic> toJson() => _$HourlyToJson(this);

  @override
  Hourly fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
}

@JsonSerializable()
class HourlyUnits extends BaseModel<HourlyUnits> {
  HourlyUnits({
    this.time,
    this.temperature2M,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) => _$HourlyUnitsFromJson(json);
  @JsonKey(name: 'time')
  String? time;
  @JsonKey(name: 'temperature_2m')
  String? temperature2M;

  @override
  Map<String, dynamic> toJson() => _$HourlyUnitsToJson(this);

  @override
  HourlyUnits fromJson(Map<String, dynamic> json) => _$HourlyUnitsFromJson(json);
}
