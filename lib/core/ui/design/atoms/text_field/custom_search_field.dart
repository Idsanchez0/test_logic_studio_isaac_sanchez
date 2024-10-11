import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomSearchField extends StatefulWidget {
  final TextEditingController controller;
  final dynamic inputType;
  final bool enable;
  final dynamic hintText;
  const CustomSearchField({
    super.key,
    required this.inputType,
    required this.enable,
    required this.hintText,
    required this.controller,
  });
  @override
  State<CustomSearchField> createState() => _CustomSearchField();
}

class _CustomSearchField extends State<CustomSearchField> {
  String env = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color: Colors.transparent,
            child: Theme(
                data: ThemeData(
                  disabledColor: Colors.black,
                ),
                child: GestureDetector(
                  child: TextField(
                    controller: widget.controller,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            PhosphorIcons.magnifyingGlass(),
                            color: Colors.grey,
                          )),
                      filled: true,
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400),
                      hintText: widget.hintText,
                      fillColor: Colors.white.withOpacity(.3),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.sp))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.sp))),
                      disabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.sp))),
                    ),
                    keyboardType: widget.inputType,
                    textInputAction: TextInputAction.done,
                    cursorColor: Colors.grey,
                    enabled: widget.enable,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Arial',
                        color: Colors.black),
                  ),
                ))),
      ],
    );
  }
}
