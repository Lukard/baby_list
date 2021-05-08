import 'package:baby_list/core/navigation/route_definition.dart';
import 'package:baby_list/feature/detail/presentation/page/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:injectable/injectable.dart';

@injectable
class DetailRouteDefinition implements RouteDefinition {
  @override
  Route? call(RouteSettings settings) {
    String? name = settings.name;

    if (name == null) return null;

    Uri uri = Uri.parse(name);

    if (uri.pathSegments.length == 4 &&
        uri.pathSegments.first == 'list' &&
        uri.pathSegments[2] == 'detail') {
      String listId = uri.pathSegments[1];
      String itemId = uri.pathSegments[3];
      return MaterialPageRoute(
        builder: (context) => Detail(
          listId: listId,
          itemId: itemId,
        ),
        settings: settings,
      );
    }

    return null;
  }
}
