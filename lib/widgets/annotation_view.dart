import 'package:bank_finder/widgets/location_annotations.dart';
import 'package:bank_finder/widgets/map_lancher.dart';
import 'package:flutter/material.dart';

import 'annotations.dart';

class AnnotationView extends StatelessWidget {
  const AnnotationView({
    super.key,
    required this.annotation,
  });

  final LocationAnnotation annotation;

  @override
  Widget build(BuildContext context) {
    // onClick Container to show details in AlertDialog
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(annotation.name),
              content: Column(
                children: [
                  Image.network(annotation.logo),
                  Text('Type: ${annotation.type}'),
                  Text('Active: ${annotation.isActive}'),
                  Text('Address: ${annotation.address}'),
                  Text('Latitude: ${annotation.latitude}'),
                  Text('Longitude: ${annotation.longitude}'),
                ],
              ),
              actions: [
                // make another button to redirect to google map
                TextButton(
                  onPressed: () {
                    MapsLauncher.launchCoordinates(
                      double.parse(annotation.latitude),
                      double.parse(annotation.longitude),
                      annotation.name,
                    );
                  },
                  child: const Text('Open in Google Map'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).primaryColor.withAlpha(80),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                child: Image.network(annotation.logo),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      annotation.name,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      // calculate disance in km
                      '${(annotation.distanceFromUser / 1000).toStringAsFixed(2)} Km',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget typeFactory(AnnotationType type) {
    IconData iconData = Icons.house_siding;
    Color color = Colors.teal;
    // switch (type) {
    //   case AnnotationType.pharmacy:
    //     iconData = Icons.local_pharmacy_outlined;
    //     color = Colors.red;
    //     break;
    //   case AnnotationType.hotel:
    //     iconData = Icons.hotel_outlined;
    //     color = Colors.green;
    //     break;
    //   case AnnotationType.library:
    //     iconData = Icons.library_add_outlined;
    //     color = Colors.blue;
    //     break;
    // }
    return Icon(
      iconData,
      size: 40,
      color: color,
    );
  }
}
