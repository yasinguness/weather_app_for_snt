import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_for_snt/network/model/base/base_model.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel extends BaseModel<CountryModel> {
  CountryModel({
    this.status,
    this.data,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'data')
  List<Datum>? data;

  @override
  Map<String, dynamic> toJson() => _$CountryModelToJson(this);

  @override
  CountryModel fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);
}

@JsonSerializable()
class Datum extends BaseModel<Datum> {
  Datum({
    this.id,
    this.name,
    this.area,
    this.population,
    this.altitude,
    this.areaCode,
    this.isMetropolitan,
    this.coordinates,
    this.districts,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'area')
  int? area;
  @JsonKey(name: 'population')
  int? population;
  @JsonKey(name: 'altitude')
  int? altitude;
  @JsonKey(name: 'areaCode')
  List<int>? areaCode;
  @JsonKey(name: 'isMetropolitan')
  bool? isMetropolitan;
  @JsonKey(name: 'coordinates')
  Coordinates? coordinates;
  @JsonKey(name: 'districts')
  List<District>? districts;

  @override
  Map<String, dynamic> toJson() => _$DatumToJson(this);

  @override
  Datum fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@JsonSerializable()
class Coordinates extends BaseModel<Coordinates> {
  Coordinates({
    this.latitude,
    this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);
  @JsonKey(name: 'latitude')
  double? latitude;
  @JsonKey(name: 'longitude')
  double? longitude;

  @override
  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);

  @override
  Coordinates fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);
}

@JsonSerializable()
class District extends BaseModel<District> {
  District({
    this.id,
    this.name,
    this.area,
    this.population,
  });

  factory District.fromJson(Map<String, dynamic> json) => _$DistrictFromJson(json);
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'area')
  int? area;
  @JsonKey(name: 'population')
  int? population;

  @override
  Map<String, dynamic> toJson() => _$DistrictToJson(this);

  @override
  District fromJson(Map<String, dynamic> json) => _$DistrictFromJson(json);
}
