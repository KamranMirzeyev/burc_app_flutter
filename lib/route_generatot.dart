import 'dart:js';

import 'package:burcapp/BurcList.dart';
import 'package:burcapp/burc-detail.dart';
import 'package:burcapp/models/burc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => BurcLists());
      case "/burcDetail":
      final Burc burc = settings.arguments as Burc;
        return MaterialPageRoute(builder: (context) => BurcDetail(burc: burc));

    }
  }
}
