import 'package:skeletonx/core/core.dart';

class YourValidator extends ValidatorCubit<YourModel> {
  bool validate({
    required YourModel? currentData,
    required YourModel oldData,
  }) {
    final isNotSameData = oldData != currentData;

    final yourDataIsNotEmpty = currentData?.yourData.isNotEmpty == true;
    final yourDataIsNotEmpty2 = currentData?.yourData.isNotEmpty == true;

    return isNotSameData && yourDataIsNotEmpty && yourDataIsNotEmpty2;
  }
}
