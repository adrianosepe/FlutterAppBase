import 'dart:ui';

import 'package:vmais/pages/shared/app_button.dart';

class DefaultsTheme {
  static Color byAction(EAppAction appAction) {
    switch (appAction) {
      case EAppAction.Primary:
        return Color(0xff0275d8);
      case EAppAction.Success:
        return Color(0xff5cb85c);
      case EAppAction.Info:
        return Color(0xff5bc0de);
      case EAppAction.Warning:
        return Color(0xfff0ad4e);
      case EAppAction.Danger:
        return Color(0xffd9534f);
      case EAppAction.Inverse:
        return Color(0xff292b2c);
      default:
        return Color(0xfff7f7f7);
    }
  }
}
