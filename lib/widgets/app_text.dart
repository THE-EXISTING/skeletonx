import 'package:skeletonx/core/core.dart';

enum TextEnum {
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  titleLg,
  titleBase,
  bodyLg,
  bodyBase,
  bodySm,
  bodyXl,
  buttonLg,
  buttonBase,
  buttonSm,
  buttonXl,
  captionBase,
  captionSm,
}

class AppText extends AppComponent {
  const AppText(
    this.data, {
    Key? key,
    this.textAlign,
    this.style,
    this.softWrap,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  final String? data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;

  static Widget create({
    required TodoFeature todo,
    required bool appbar,
    GestureTapCallback? onPress,
  }) =>
      TodoView(
        todo: todo,
        appbar: appbar,
        onPress: onPress,
      );

  @override
  Widget buildDefault(BuildContext context) {
    return Text(
      data ?? '',
      key: key,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: softWrap,
      style: style,
      maxLines: maxLines,
    );
  }
}
