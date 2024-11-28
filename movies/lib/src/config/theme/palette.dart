import 'package:flutter/cupertino.dart';

import '../../utils/color_utils.dart';

/// Primary - Palette
final primary500 = HexColor.fromHex('#29A9BC');
final primary900 = HexColor.fromHex('#0D3C42');
final primary800 = HexColor.fromHex('#125660');
final primary700 = HexColor.fromHex('#1D7784');
final primary600 = HexColor.fromHex('#2394A5');
final primary400 = HexColor.fromHex('#2EB8CC');
final primary300 = HexColor.fromHex('#33C9DF');
final primary200 = HexColor.fromHex('#38D9F0');
final primary100 = HexColor.fromHex('#3CE6FF');
final primary50 = HexColor.fromHex('#C5F8FF');

/// Secondary - Palette
final secondary500 = HexColor.fromHex('#757777');
final secondary900 = HexColor.fromHex('#242B2C');
final secondary800 = HexColor.fromHex('#2F3435');
final secondary700 = HexColor.fromHex('#3F4647');
final secondary600 = HexColor.fromHex('#5A6465');
final secondary400 = HexColor.fromHex('#929F9F');
final secondary300 = HexColor.fromHex('#B5BEBE');
final secondary200 = HexColor.fromHex('#CAD1D1');
final secondary100 = HexColor.fromHex('#E4EFEF');
final secondary50 = HexColor.fromHex('#F7FAFA');

final backgroundColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    primary800,
    primary400,
  ],
);
