import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/colors/app_color_scheme.dart';
import '../resources/text/app_text_theme.dart';

class CustomTextField extends StatelessWidget {
  final int minLines;
  final int maxLines;
  final int maxLength;
  final bool obscureText;
  final bool? autofocus;
  final bool readOnly;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final String counterText;
  final String obscuringCharacter;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final void Function(PointerDownEvent)? onTapOutside;
  final InputBorder enabledBorder;
  final InputBorder focusedBorder;
  final TextAlign textAlign;
  final MaxLengthEnforcement maxLengthEnforcement;
  final TextEditingController? controller;
  final List<TextInputFormatter> inputFormatters;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.initialValue,
    this.onChanged,
    this.obscuringCharacter = '*',
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.maxLines = 1,
    this.minLines = 1,
    this.onSaved,
    this.autofocus,
    this.style,
    this.onTapOutside,
    this.hintStyle,
    this.enabledBorder = const OutlineInputBorder(),
    this.focusedBorder = const OutlineInputBorder(),
    this.maxLength = 80,
    this.counterText = '',
    this.maxLengthEnforcement = MaxLengthEnforcement.none,
    this.textAlign = TextAlign.start,
    this.controller,
    this.readOnly = false,
    this.inputFormatters = const [],
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return TextFormField(
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      style: style ??
          textTheme.regular14.copyWith(
            color: colorScheme.secondary,
          ),
      obscuringCharacter: obscuringCharacter,
      keyboardType: keyboardType,
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      textInputAction: textInputAction,
      onTapOutside: onTapOutside,
      maxLengthEnforcement: maxLengthEnforcement,
      textAlign: textAlign,
      controller: controller,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      // contextMenuBuilder: (context, editableTextState) {
      //   return AdaptiveTextSelectionToolbar(
      //     anchors: editableTextState.contextMenuAnchors,
      //     children: editableTextState.contextMenuButtonItems.map(
      //           (ContextMenuButtonItem buttonItem) {
      //         return CupertinoButton(
      //           borderRadius: null,
      //           color: colorScheme.secondary,
      //           // disabledColor: colorScheme.secondary,
      //           onPressed: buttonItem.onPressed,
      //           padding: const EdgeInsets.all(10.0),
      //           pressedOpacity: 0.7,
      //           child: SizedBox(
      //             // width: 200.0,
      //             child: Text(
      //               CupertinoTextSelectionToolbarButton.getButtonLabel(
      //                 context,
      //                 buttonItem,
      //               ),
      //               style: textTheme.regular14.copyWith(
      //                 color: colorScheme.surface,
      //               ),
      //             ),
      //           ),
      //         );
      //       },
      //     ).toList(),
      //   );
      // },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        counterText: counterText,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
