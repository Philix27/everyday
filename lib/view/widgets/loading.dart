import 'package:everyday/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading {
  static Widget spinKitThreeBounce({Color? color}) => Center(
        child: SpinKitThreeBounce(color: color ?? Styles.primaryColor),
      );

  static Widget spinKitFadingCircle({Color? color}) => Center(
        child: SpinKitFadingCircle(color: color ?? Styles.primaryColor),
      );
  static Widget cubegrid({Color? color}) => Center(
        child: SpinKitCubeGrid(color: color ?? Styles.primaryColor),
      );
}
