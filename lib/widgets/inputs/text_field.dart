import 'package:skeletonx/core/core.dart';

// class AppTextField extends AppComponentGroup {
//   const AppTextField({
//     Key? key,
//     required this.onTextChange,
//     this.border = true,
//     this.hintText,
//     this.titleText,
//     this.controller,
//     this.focusNode,
//     this.textAlign = TextAlign.start,
//     this.textInputAction,
//     this.onEditingComplete,
//     this.obscure = false,
//     this.error = false,
//     this.isSuffixIcon = false,
//     this.maxLines = 1,
//     this.maxLength,
//     this.suffixIcon,
//     this.errorText,
//     this.keyboardType,
//     this.inputFormatters,
//     this.initialValue,
//     this.disabled = false,
//     this.readOnly = false,
//   }) : super(key: key);
//
//   final double borderRadius = 8.0;
//   final bool border;
//   final String? hintText;
//   final String? titleText;
//   final TextEditingController? controller;
//   final FocusNode? focusNode;
//   final TextAlign textAlign;
//   final TextInputAction? textInputAction;
//   final VoidCallback? onEditingComplete;
//   final bool obscure;
//   final bool error;
//   final bool isSuffixIcon;
//   final int? maxLines;
//   final int? maxLength;
//   final Widget? suffixIcon;
//   final String? errorText;
//   final ValueChanged<String>? onTextChange;
//   final TextInputType? keyboardType;
//   final List<TextInputFormatter>? inputFormatters;
//   final String? initialValue;
//   final bool disabled;
//   final bool readOnly;
//
//   @override
//   State<StatefulWidget> createState() => _AppTextFieldState();
// }
//
// class _AppTextFieldState extends StateX<AppTextField> {
//   late bool obscure;
//
//   @override
//   void initState() {
//     obscure = widget.obscure;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildTitleText(),
//         Container(
//           margin: EdgeInsets.only(bottom: widget.error ? 5 : 18),
//           width: double.infinity,
//           child: TextFormField(
//             initialValue: widget.initialValue?.isNotEmpty == true
//                 ? widget.initialValue
//                 : null,
//             maxLines: widget.maxLines,
//             maxLength: widget.maxLength,
//             onChanged: widget.onTextChange,
//             inputFormatters: widget.inputFormatters,
//             keyboardType: widget.keyboardType,
//             cursorColor: Colors.black,
//             cursorWidth: 1,
//             controller: widget.controller,
//             textInputAction: widget.textInputAction,
//             focusNode: widget.focusNode,
//             onEditingComplete: widget.onEditingComplete,
//             textAlign: widget.textAlign,
//             style: AppTextStyle.primary.body1.blackActive,
//             obscureText: obscure,
//             obscuringCharacter: '•',
//             enabled: !widget.disabled,
//             readOnly: widget.disabled || widget.readOnly,
//             decoration: InputDecoration(
//               isDense: true,
//               labelStyle: AppTextStyle.primary.body1.blackActive,
//               suffixIcon: widget.suffixIcon ??
//                   (widget.isSuffixIcon
//                       ? IconButton(
//                           icon: obscure
//                               ? AppIcons.ic_visibility_off
//                                   .toSvgIcon(color: AppColors.blackDisabled)
//                               : AppIcons.ic_visibility
//                                   .toSvgIcon(color: AppColors.blackDisabled),
//                           onPressed: () {
//                             setState(() {
//                               obscure = !obscure;
//                             });
//                           },
//                         )
//                       : null),
//               contentPadding: const EdgeInsets.all(12.0),
//               focusedBorder: borderStyle(color: AppColors.primary, width: 2),
//               enabledBorder:
//                   borderStyle(color: AppColors.icon.blackDisabled, width: 1),
//               disabledBorder:
//                   borderStyle(color: AppColors.icon.blackDivider, width: 1),
//               hintText: widget.hintText,
//               hintStyle: AppTextStyle.primary.body1.blackDisabled,
//               errorBorder:
//                   borderStyle(color: AppColors.status.errorLightMode, width: 2),
//               focusedErrorBorder:
//                   borderStyle(color: AppColors.status.errorLightMode, width: 2),
//               errorText: widget.error ? widget.errorText ?? "" : null,
//               errorStyle: AppTextStyle.primary.body2
//                   .custom(color: AppColors.status.errorLightMode),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTitleText() {
//     if (widget.titleText.isNotNullOrEmpty) {
//       return Padding(
//         padding: EdgeInsets.only(left: widget.borderRadius / 2, bottom: 2.0),
//         child: AppText(
//           widget.titleText,
//           style: AppTextStyle.primary.body2.blackActive,
//         ),
//       );
//     }
//     return const Space.box(0);
//   }
//
//   InputBorder borderStyle({required Color color, required double width}) {
//     if (widget.border) {
//       return OutlineInputBorder(
//         borderSide: BorderSide(color: color, width: width),
//         borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
//       );
//     } else {
//       return UnderlineInputBorder(
//         borderSide: BorderSide(color: color, width: width),
//         borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
//       );
//     }
//   }
// }
