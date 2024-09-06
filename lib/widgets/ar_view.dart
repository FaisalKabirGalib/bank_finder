import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../ar_location_widget.dart';
import '../ar_radar.dart';
import 'annotation_view.dart';
import 'annotations.dart';

class LocationArView extends StatefulWidget {
  const LocationArView({super.key});

  @override
  State<LocationArView> createState() => _LocationArViewState();
}

class _LocationArViewState extends State<LocationArView> {
  List<Annotation> annotations = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ArLocationWidget(
          annotations: annotations,
          showDebugInfoSensor: true,
          annotationWidth: 180,
          annotationHeight: 60,
          radarPosition: RadarPosition.bottomCenter,
          annotationViewBuilder: (context, annotation) {
            return AnnotationView(
              key: ValueKey(annotation.uid),
              annotation: annotation as Annotation,
            );
          },
          radarWidth: 160,
          scaleWithDistance: false,
          onLocationChange: (Position position) {
            Future.delayed(const Duration(seconds: 5), () {
              annotations =
                  fakeAnnotation(position: position, numberMaxPoi: 50);
              setState(() {});
            });
          },
        ),
      ),
    );
  }
}
