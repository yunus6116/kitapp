import '../../../core/extensions/context_extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum TextFieldType {
  normal,
  mail,
  password,
  phone,
}

class ControlledTextField extends HookWidget {
  final TextEditingController textEditingController;
  final String? prefixText, label, value, headerText, hintText, helperText;
  final bool isParagraph;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final FocusNode? focusNode, nextFocusNode;
  final Function(String)? onChange;
  final Function(String)? onFiedlSubmitted;
  final Function(String?)? onSaved;
  final FormFieldValidator<String>? validate;
  final int? minimumLine;
  final int? maximumLine;
  final int? maxLength;
  final TextFieldType? textFieldType;
  final bool? isAllCharactersUppercase;
  final TextStyle? placeHolderTextStyle;
  final bool displayBorder;
  final bool obscureText;
  final bool? isFilled;
  final Color? fillColor;
  final Color? focusedBorderColor;
  final Widget? suffixIcon, prefixIcon;
  final IconData? prefixIconData;
  final bool readOnly;
  final VoidCallback? onTap, onEditingComplete;
  final InputBorder? inputBorder;
  final TextStyle? textStyle, labelStyle;
  final EdgeInsetsGeometry? contentPadding;
  final bool isDense;
  const ControlledTextField({
    required this.textEditingController,
    this.hintText,
    this.onChange,
    this.isFilled,
    this.fillColor,
    this.focusedBorderColor,
    this.onEditingComplete,
    this.isParagraph = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType,
    this.focusNode,
    this.nextFocusNode,
    this.validate,
    this.value,
    this.prefixText,
    this.helperText,
    this.label,
    this.headerText,
    this.labelStyle,
    this.minimumLine = 1,
    this.maximumLine,
    this.maxLength,
    this.textFieldType = TextFieldType.normal,
    this.isAllCharactersUppercase = false,
    this.placeHolderTextStyle,
    this.displayBorder = true,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.onFiedlSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.prefixIconData,
    this.inputBorder,
    this.textStyle,
    this.contentPadding,
    this.onSaved,
    this.isDense = false,
  });

  TextInputType getTextInputType() {
    switch (textFieldType) {
      case TextFieldType.normal:
        return TextInputType.text;
      case TextFieldType.phone:
        return TextInputType.number;
      case TextFieldType.mail:
        return TextInputType.emailAddress;
      default:
        return TextInputType.text;
    }
  }

  Widget _buildTextField(BuildContext context, FocusNode fieldFocusNode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerText != null
            ? Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  headerText!,
                ),
              )
            : const SizedBox(),
        Padding(
            padding: EdgeInsets.symmetric(vertical: headerText != null ? 6 : 0),
            child: TextFormField(
              onSaved: onSaved ??
                  (_) => _nextFocus(nextFocusNode, context, fieldFocusNode),
              onTap: onTap,
              controller: textEditingController,
              focusNode: focusNode,
              readOnly: readOnly,
              style: textStyle ?? context.textTheme.bodyText2,
              cursorColor: context.theme.primaryColorDark.withOpacity(0.4),
              minLines: isParagraph ? minimumLine : null,
              maxLines: isParagraph ? maximumLine : 1,
              validator: validate,
              textInputAction: textInputAction,
              keyboardType: textInputType ?? getTextInputType(),
              maxLength: maxLength,
              textCapitalization: isAllCharactersUppercase!
                  ? TextCapitalization.characters
                  : TextCapitalization.none,
              obscureText: obscureText,
              decoration: InputDecoration(
                isDense: isDense,
                fillColor: fillColor,
                filled: isFilled,
                helperText: helperText,
                helperMaxLines: 3,
                helperStyle: context.textTheme.button,
                errorStyle: context.textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.errorColor,
                    height: 1),
                contentPadding: contentPadding,
                alignLabelWithHint: true,
                labelText: label,
                floatingLabelStyle: context.textTheme.subtitle1!
                    .copyWith(color: context.theme.primaryColorDark),
                labelStyle: labelStyle ??
                    labelStyle ??
                    context.textTheme.subtitle1!.copyWith(
                        color: context.theme.primaryColorDark.withOpacity(0.6)),
                prefixText: prefixText,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon ??
                    (prefixIconData != null
                        ? Icon(
                            prefixIconData,
                            size: 20,
                          )
                        : null),
                hintText: hintText,
                hintMaxLines: minimumLine,
                hintStyle: placeHolderTextStyle ??
                    context.textTheme.subtitle1!.copyWith(
                        color: context.theme.primaryColorDark.withOpacity(0.6)),
                counter: const Offstage(),
                border: _getBorderStyle(
                  context,
                  displayBorder,
                ),
                enabledBorder: _getBorderStyle(
                  context,
                  displayBorder,
                ),
                focusedBorder: _getBorderStyle(
                  context,
                  displayBorder,
                  isFocused: true,
                ),
                errorBorder: _getBorderStyle(
                  context,
                  displayBorder,
                  hasError: true,
                ),
              ),
              onChanged: onChange,
              onFieldSubmitted: onFiedlSubmitted ??
                  (_) => _nextFocus(nextFocusNode, context, fieldFocusNode),
              onEditingComplete: onEditingComplete,
            )),
      ],
    );
  }

  _nextFocus(FocusNode? nextFocusNode, BuildContext context,
      FocusNode fieldFocusNode) {
    fieldFocusNode.unfocus();
    if (nextFocusNode != null) {
      FocusScope.of(context).requestFocus(nextFocusNode);
    }
  }

  @override
  Widget build(BuildContext context) {
    final fieldFocusNode = focusNode ?? useFocusNode();
    return _buildTextField(context, fieldFocusNode);
  }

  InputBorder _getBorderStyle(
    BuildContext context,
    bool displayBorder, {
    bool isFocused = false,
    bool hasError = false,
  }) =>
      displayBorder
          ? inputBorder == null
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    width: isFocused ? 2 : 1,
                    color: hasError
                        ? context.theme.errorColor
                        : isFocused
                            ? focusedBorderColor ??
                                context.theme.primaryColorDark.withOpacity(0.4)
                            : context.theme.dividerColor,
                  ),
                )
              : inputBorder!
          : InputBorder.none;
}
