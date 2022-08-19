import 'package:flutter/material.dart';
import '../ui/identify_theme.dart';

class IdentifyMyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const IdentifyMyButton({Key? key, required this.label, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
          backgroundColor: MaterialStateProperty.all<Color>(primaryClr),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Colors.blueAccent)
              )
          ),
        ),
        onPressed: onTap,
        child: Text(
            label,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            )
        ),
    );
  }
}
