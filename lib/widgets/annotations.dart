import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';

import '../ar_annotation.dart';

enum AnnotationType { pharmacy, hotel, library }

class Annotation extends ArAnnotation {
  final String name;

  Annotation({
    required super.uid,
    required super.position,
    required this.name,
  });
}

String getRandomAnnotation() {
  final names = [
    'Gulsan Branch',
    'Bashundhara Branch',
    'Uttara Branch',
    "Dhanmondi Branch",
    "Mirpur Branch",
    "Mohammadpur Branch",
    "Banani Branch",
    "Baridhara Branch",
    "Khilgaon Branch",
    "Shantinagar Branch",
    "Hardi Branch",
    "Kuril Branch",
    "Kamalapur Branch",
    "Kamrangirchar Branch",
    "Keraniganj Branch",
    "Kotwali Branch",
    "Lalbagh Branch",
    "Motijheel Branch",
    "New Market Branch",
    "Paltan Branch",
    "Ramna Branch",
    "Sabujbagh Branch",
    "Shahbag Branch",
    "Sutrapur Branch",
    "Tejgaon Branch",
    "Tejgaon Industrial Area Branch",
    "Turag Branch",
    "Uttar Khan Branch",
    "Uttara Model Town Branch",
    "Vatara Branch",
    "Wari Branch",
    "Zigatola Branch"
  ];
  final index = Random.secure().nextInt(names.length);
  return names[index];
}

///Create fake annotations for example
List<Annotation> fakeAnnotation(
    {required Position position, int distance = 1500, int numberMaxPoi = 100}) {
  return List<Annotation>.generate(
    numberMaxPoi,
    (index) {
      return Annotation(
        uid: const Uuid().v1(),
        position: getRandomLocation(
          position.latitude,
          position.longitude,
          distance / 100000,
          distance / 100000,
        ),
        name: getRandomAnnotation(),
      );
    },
  );
}

Position getRandomLocation(double centerLatitude, double centerLongitude,
    double deltaLat, double deltaLon) {
  var lat = centerLatitude;
  var lon = centerLongitude;

  final latDelta = -(deltaLat / 2) + Random.secure().nextDouble() * deltaLat;
  final lonDelta = -(deltaLon / 2) + Random.secure().nextDouble() * deltaLon;
  lat = lat + latDelta;
  lon = lon + lonDelta;

  return Position(
    longitude: lon,
    latitude: lat,
    timestamp: DateTime.now(),
    accuracy: 1,
    altitude: 1,
    heading: 1,
    speed: 1,
    speedAccuracy: 1,
    altitudeAccuracy: 0,
    headingAccuracy: 0,
  );
}
