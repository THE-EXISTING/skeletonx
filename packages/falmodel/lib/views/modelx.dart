import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:falmodel/falmodel.dart';
import 'package:faltool/faltool.dart';

abstract class ModelX<T> with EquatableMixin {
  ModelX();

  @override
  bool? get stringify => true;

  T copyWith();
}
