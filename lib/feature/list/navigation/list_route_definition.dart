import 'package:baby_list/core/navigation/route_definition.dart';
import 'package:baby_list/feature/list/presentation/page/baby_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:injectable/injectable.dart';

@injectable
class ListRouteDefinition implements RouteDefinition {
  static const String _PATH = 'list';

  @override
  Route? call(RouteSettings settings) {
    String? name = settings.name;

    if (name == null) return null;

    Uri uri = Uri.parse(name);

    if (uri.pathSegments.length == 2 && uri.pathSegments.first == _PATH) {
      String listId = uri.pathSegments[1];
      return MaterialPageRoute(
          builder: (context) => BabyList(listId: listId), settings: settings);
    }

    return null;
  }
}
