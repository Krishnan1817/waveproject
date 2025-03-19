import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonLoader extends StatelessWidget {
  const CommonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: Center(
          child: SizedBox(
        width: context.isTablet ? 80 : 45,
        height: context.isTablet ? 80 : 45,
        child: CircularProgressIndicator(
          color: Color(0xff043E99),
          strokeWidth: context.isTablet ? 5.0 : 3.0,
        ),
      )),
    );
  }
}
