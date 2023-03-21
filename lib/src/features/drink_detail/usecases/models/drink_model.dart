import 'package:skeletonx/core/core.dart';

class DrinkModel with EquatableMixin {
  const DrinkModel({
    required this.id,
    required this.name,
    required this.instruction,
    required this.category,
    required this.thumbnailUrl,
    required this.imgUrl,
    required this.videoUrl,
  });

  final String id;
  final String name;
  final String instruction;
  final String category;
  final String thumbnailUrl;
  final String imgUrl;
  final String videoUrl;

  @override
  List<Object?> get props => [
        id,
        name,
        instruction,
        category,
        thumbnailUrl,
        imgUrl,
        videoUrl,
      ];

  @override
  bool? get stringify => true;

  static DrinkModel fromResponse(DrinkResponse response) => DrinkModel(
        id: response.idDrink!,
        name: response.strDrink!,
        instruction: response.strInstructions!,
        category: response.strCategory ?? '',
        thumbnailUrl: response.strDrinkThumb!,
        imgUrl: response.strImageSource ?? '',
        videoUrl: response.strVideo ?? '',
      );
}
