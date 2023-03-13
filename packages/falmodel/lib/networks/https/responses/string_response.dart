import 'package:falmodel/falmodel.dart';

/// {
///   'string': 'string'
/// }

class StringResponse extends ResponseBodyX<String> {
  StringResponse({
    required int statusCode,
    required String string,
  }) : super(statusCode: statusCode, data: string);
}

