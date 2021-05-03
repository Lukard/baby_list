import 'package:baby_list/core/error/error_notifier.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ErrorModule {
  @singleton
  ErrorNotifier get errorNotifier => ErrorNotifier();
}
