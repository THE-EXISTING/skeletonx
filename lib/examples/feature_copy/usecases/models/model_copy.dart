import 'package:skeletonx/core/core.dart';

class YourModel extends ModelX<YourModel> {
  YourModel({
    required this.yourData,
  });

  final String yourData;

  @override
  List<Object?> get props => [yourData];

  @override
  YourModel copyWith({
    String? yourData,
  }) =>
      YourModel(
        yourData: yourData ?? this.yourData,
      );

  static YourModel fromResponse(Response response) => YourModel(
        yourData: '',
      );
}
