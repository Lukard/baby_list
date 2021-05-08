import 'package:flutter/material.dart';

abstract class RouteDefinition {
  Route? call(RouteSettings settings);
}
