import 'package:skeletonx/core/core.dart';

abstract class ViewException implements Exception {
  final String? message;

  ViewException({required this.message});
}
