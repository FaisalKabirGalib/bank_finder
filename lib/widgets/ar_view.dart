import 'package:bank_finder/widgets/location_annotations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../ar_location_widget.dart';
import '../ar_radar.dart';
import 'annotation_view.dart';

class LocationArView extends StatefulWidget {
  const LocationArView({super.key});

  @override
  State<LocationArView> createState() => _LocationArViewState();
}

class _LocationArViewState extends State<LocationArView> {
  List<LocationAnnotation> annotations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArLocationWidget(
        annotations: annotations,
        showDebugInfoSensor: true,
        annotationWidth: 180,
        annotationHeight: 60,
        maxVisibleDistance: 1000000000,
        radarPosition: RadarPosition.bottomCenter,
        annotationViewBuilder: (context, annotation) {
          return AnnotationView(
            key: ValueKey(annotation.uid),
            annotation: annotation as LocationAnnotation,
          );
        },
        radarWidth: 160,
        scaleWithDistance: true,
        onLocationChange: (Position position) {
          fetchAnnotation().then((value) {
            annotations = value;
            debugPrint('Annotations: $annotations');
            setState(() {});
          });
          // Future.delayed(const Duration(seconds: 5), () {
          //   annotations =
          //       fakeAnnotation(position: position, numberMaxPoi: 50);
          //   setState(() {});
          // });
        },
      ),
    );
  }
}

Future<List<LocationAnnotation>> fetchAnnotation() {
  return Dio()
      .get("https://amarhisab.softcellbd.net/api/v1/branches")
      .then((response) {
    final resData = response.data['data'] as List<dynamic>;
    return resData.map((e) => LocationAnnotation.fromMap(e)).toList();
  });
}
