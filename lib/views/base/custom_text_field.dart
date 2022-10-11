import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {

  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function onChanged;
  final Function onSubmit;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final String prefixIcon;
  final bool divider;



  CustomTextField(
      {this.hintText = '',
        required this.controller,
        required this.focusNode,
        required this.nextFocus,
        this.isEnabled = true,
        this.inputType = TextInputType.text,
        this.inputAction = TextInputAction.next,
        this.maxLines = 1,
        required this.onSubmit,
        required this.onChanged,
        this.capitalization = TextCapitalization.none,
        this.isPassword = false,
        required this.prefixIcon,
        required this.divider,
        });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      curveType: CurveType.concave,
      borderRadius:5 ,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          TextField(
            textAlignVertical: TextAlignVertical.center,
            maxLines: widget.maxLines,
            controller: widget.controller,
            focusNode: widget.focusNode,
            //style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),
            textInputAction: widget.inputAction,
            keyboardType: widget.inputType,
            cursorColor: Theme.of(context).primaryColor,
            textCapitalization: widget.capitalization,
            enabled: widget.isEnabled,
            autofocus: false,
            obscureText: widget.isPassword ? _obscureText : false,
            //inputFormatters: widget.inputType == TextInputType.phone ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9]'))] : null,
            decoration: InputDecoration(
              border: InputBorder.none,

              // enabledBorder: OutlineInputBorder(
              //
              //   borderRadius: BorderRadius.circular(Dimensions.RADIUS_category_border_r), //--enable-b-r-
              //
              // ),
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(style: BorderStyle.none, width: 0.3,),
              // ),
              alignLabelWithHint:true ,
              isDense: true,
              hintText: widget.hintText,
              fillColor: Theme.of(context).backgroundColor,
              //hintStyle: GoogleFonts.inter(fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).hintColor),
              filled: true,
              prefixIcon: widget.prefixIcon != null ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Image.asset(widget.prefixIcon, height: 20, width: 20),
              ) : null,
              suffixIcon: widget.isPassword ? IconButton(
                icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: Theme.of(context).hintColor.withOpacity(0.3)),
                onPressed: _toggle,
              ) : null,
            ),
            onSubmitted: (text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus)
                : widget.onSubmit != null ? widget.onSubmit(text) : null,
            onChanged: widget.onChanged(),
          ),

          //widget.divider ? Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE), child: Divider()) : SizedBox(),
        ],
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
