import 'package:equatable/equatable.dart';
import 'package:falmodel/falmodel.dart';
import 'package:faltool/faltool.dart';

abstract class ModelX<T> with EquatableMixin {
  ModelX({String? generatedId})
      : generatedId = generatedId ?? UniqueKeyX.generateUuid();

  final String generatedId;

  @override
  bool? get stringify => true;

  T copyWith();
}
