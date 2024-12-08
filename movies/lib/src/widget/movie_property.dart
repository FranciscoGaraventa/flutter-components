import 'package:flutter/material.dart';

import '../config/theme/palette.dart';
import '../utils/dimens.dart';

class MovieProperty extends StatelessWidget {
  const MovieProperty({
    super.key,
    required this.propertyName,
    required this.propertyValue,
  });

  final String propertyName;
  final String propertyValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          propertyValue,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: primary50,
            fontWeight: FontWeight.bold,
            fontSize: CustomTextFontSize.fontSizeMedium,
          ),
        ),
        Text(
          propertyName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: secondary900,
            fontWeight: FontWeight.w500,
            fontSize: CustomTextFontSize.fontSizeXSmall,
          ),
        )
      ],
    );
  }
}
