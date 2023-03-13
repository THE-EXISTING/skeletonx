import 'package:falmodel/falmodel.dart';

class EmptyResponse extends ResponseBodyX<Object> {
  EmptyResponse({
    required int statusCode,
  }) : super(statusCode: statusCode, data: '');
}
