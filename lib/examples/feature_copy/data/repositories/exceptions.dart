import 'package:skeletonx/core/core.dart';

enum YourDataExceptionType {
  ERROR_EMPTY_KSHER,
}

class YourDataException extends DataException<YourDataExceptionType>{
  YourDataException._({
    required YourDataExceptionType type,
    String? message
  }) : super(type: type, message: message);


  static DataException emptyKsherMID([String? msg]) => //
  YourDataException._(
    type: YourDataExceptionType.ERROR_EMPTY_KSHER,
    message: msg ?? 'Missing Firebase user',
  );
}

