import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ui/identify_theme.dart';

class IdentifyMyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const IdentifyMyInputField({Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.only(left: 14),
            //color: Colors.grey,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey,
                  width: 1.0
              ),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget==null?false:true,
                    autofocus: false,
                    cursorColor: Colors.grey[700],
                    controller: controller,
                    style: subTitleStyle,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subTitleStyle,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.backgroundColor,
                          width: 0
                        )
                      ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: context.theme.backgroundColor,
                                width: 0
                            )
                        ),
                    ),
                  ),
                ),
                widget==null?Container():Container(child: widget)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyInputField2 extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField2({Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.only(left: 14),
            //color: Colors.grey,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey,
                    width: 1.0
                ),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    readOnly: widget==null?false:true,
                    autofocus: false,
                    cursorColor: Colors.grey[700],
                    controller: controller,
                    style: subTitleStyle,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subTitleStyle,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: context.theme.backgroundColor,
                              width: 0
                          )
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: context.theme.backgroundColor,
                              width: 0
                          )
                      ),
                    ),
                  ),
                ),
                widget==null?Container():Container(child: widget)
              ],
            ),
          )
        ],
      ),
    );
  }
}