import 'package:flutter/material.dart';
class AppInput extends StatefulWidget {
  final String label ;
  final String? hint;
  final bool isMultiLine;
  final bool isPassword;
  final String? Function(String?value)? validator ;
  final TextEditingController? controller ;
  final TextInputType? keyboardType;
  const AppInput ({Key? key, required this.label, this.keyboardType, this.isPassword=false, this.hint, this.isMultiLine=false,  this.controller, this.validator,}): super(key: key);
  @override
  State<AppInput> createState() => _AppInputState();
}
class _AppInputState extends State<AppInput> {
  bool isHidden=true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: widget.controller,
        obscureText: isHidden&&widget.isPassword,
        keyboardType:widget.keyboardType ,
        maxLines: widget.isMultiLine?3:1,
        validator: widget.validator,
        decoration: InputDecoration(
            labelText: widget.label,
            alignLabelWithHint: true,
            hintText: widget.hint,
            suffixIcon:widget.isPassword? IconButton (
              icon: Icon(
                  isHidden ? Icons.visibility_off : Icons.visibility),
              onPressed: (){
                isHidden = !isHidden;
                setState(() {});
              },
            ):null
        ),
      ),
    );
  }
}
