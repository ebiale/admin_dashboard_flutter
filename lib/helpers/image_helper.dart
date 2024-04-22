import 'package:flutter/foundation.dart';

class ImageHelper {
  static String getImagePath(String imgName) {
    String path = 'images/$imgName';

    return kIsWeb ? path : 'assets/$path';
  }
}
