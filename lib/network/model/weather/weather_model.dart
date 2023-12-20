import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_for_snt/network/model/base/base_model.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends BaseModel<WeatherModel> {
  WeatherModel({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.dailyUnits,
    this.daily,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
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
  @JsonKey(name: 'daily_units')
  DailyUnits? dailyUnits;
  @JsonKey(name: 'daily')
  Daily? daily;

  @override
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  @override
  WeatherModel fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
}

@JsonSerializable()
class Daily extends BaseModel<Daily> {
  Daily({
    this.time,
    this.temperature2M,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);
  @JsonKey(name: 'time')
  List<String>? time;
  @JsonKey(name: 'temperature_2m_max')
  List<double>? temperature2M;

  @override
  Map<String, dynamic> toJson() => _$DailyToJson(this);

  @override
  Daily fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);
}

@JsonSerializable()
class DailyUnits extends BaseModel<DailyUnits> {
  DailyUnits({
    this.time,
    this.temperature2M,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) => _$DailyUnitsFromJson(json);
  @JsonKey(name: 'time')
  String? time;
  @JsonKey(name: 'temperature_2m_max')
  String? temperature2M;

  @override
  Map<String, dynamic> toJson() => _$DailyUnitsToJson(this);

  @override
  DailyUnits fromJson(Map<String, dynamic> json) => _$DailyUnitsFromJson(json);
}
