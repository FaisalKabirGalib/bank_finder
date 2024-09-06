import 'package:flutter/material.dart';

import 'annotations.dart';

class AnnotationView extends StatelessWidget {
  const AnnotationView({
    super.key,
    required this.annotation,
  });

  final Annotation annotation;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.teal.withAlpha(80),
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
              child: const Icon(
                Icons.house_siding,
                size: 40,
                color: Colors.white,
              ),
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
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    '${annotation.distanceFromUser.toInt()} m',
                  ),
                ],
              ),
            ),
          )
        ],
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
