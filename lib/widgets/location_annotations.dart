import 'dart:convert';

import 'package:bank_finder/bank_finder.dart';
import 'package:geolocator/geolocator.dart';

class LocationAnnotation extends ArAnnotation {
  int id;
  String name;
  String type;
  String logo;
  String latitude;
  String longitude;
  String address;
  bool isActive;

  LocationAnnotation({
    required this.id,
    required this.name,
    required this.type,
    required this.logo,
    required this.latitude,
    required this.longitude,
    required this.isActive,
    required this.address,
  }) : super(
          position: Position(
            latitude: double.parse(latitude),
            longitude: double.parse(longitude),
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
            altitudeAccuracy: 0,
            headingAccuracy: 0,
          ),
          uid: id.toString(),
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'logo': logo,
      'latitude': latitude,
      'longitude': longitude,
      'is_active': isActive,
    };
  }

  Annotation toAnnotation() {
    return Annotation(
      position: Position(
        latitude: double.parse(latitude),
        longitude: double.parse(longitude),
        timestamp: DateTime.now(),
        accuracy: 1,
        altitude: 1,
        heading: 1,
        speed: 1,
        speedAccuracy: 1,
        altitudeAccuracy: 0,
        headingAccuracy: 0,
      ),
      uid: id.toString(),
      name: name,
    );
  }

  factory LocationAnnotation.fromMap(dynamic map) {
    return LocationAnnotation(
      id: map['id'] as int,
      name: map['name'] as String,
      type: map['type'] as String,
      logo: map['logo'] as String,
      address: map['address'] as String,
      latitude: map['latitude'] as String,
      longitude: map['longitude'] as String,
      isActive: map['is_active'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationAnnotation.fromJson(String source) =>
      LocationAnnotation.fromMap(json.decode(source) as Map<String, dynamic>);
}
