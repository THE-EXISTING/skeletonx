import 'package:skeletonx/core/core.dart';

class YourModel with EquatableMixin {
  const YourModel({
    required this.yourData,
  });

  final String yourData;

  @override
  List<Object?> get props => [yourData];

  @override
  bool? get stringify => true;

  static YourModel fromResponse(Response response) => const YourModel(
        yourData: '',
      );
}
