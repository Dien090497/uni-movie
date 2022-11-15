import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/common/style/app_colors.dart';
import 'package:movie_app/common/style/text_styles.dart';

class MCTextField extends StatefulWidget {
  const MCTextField({
    this.labelText,
    this.hintText,
    this.errorText,
    this.initialText,
    this.hintStyle,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.prefixIcon,
    this.noBorder = false,
    this.readonly = false,
    this.showLabel = true,
    Key? key,
    this.maxLine,
    this.maxLength,
    this.controller,
    this.onChanged,
    this.textInputType,
    this.textStyle,
    this.inputFormatters,
    this.focusNode,
    this.textAlign,
    this.enabled,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final String? errorText;
  final String? initialText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool noBorder;
  final bool? enabled;
  final bool readonly;
  final int? maxLine;
  final int? maxLength;
  final TextEditingController? controller;
  final bool showLabel;
  final TextAlign? textAlign;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  @override
  State<MCTextField> createState() => _MCTextFieldState();
}

class _MCTextFieldState extends State<MCTextField> {
  late final controller = widget.controller ?? TextEditingController();

  @override
  void initState() {
    controller.text = widget.initialText ?? controller.text;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showLabel
            ? Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  widget.labelText ?? "",
                  style: TextStyles.h3,
                ),
              )
            : const SizedBox(),
        TextField(
          style: widget.textStyle ?? TextStyles.h3,
          controller: controller,
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          keyboardType: widget.textInputType,
          inputFormatters: widget.inputFormatters,
          readOnly: widget.readonly,
          textCapitalization: TextCapitalization.none,
          textAlign: widget.textAlign ?? TextAlign.start,
          enabled: widget.enabled,
          decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              prefix: widget.prefix,
              filled: true,
              isDense: true,
              // hintText: hintText != null ? translate(hintText!) : null,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle ?? TextStyles.h3,
              suffix: widget.suffix,
              suffixIcon: widget.suffixIcon,
              counterText: "",
              errorText: widget.errorText,
              errorMaxLines: 10),
          maxLines: widget.maxLine ?? 1,
          maxLength: widget.maxLength,
        ),
      ],
    );
  }
}
