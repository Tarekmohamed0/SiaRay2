import 'package:first_project/Doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocLogoName extends StatelessWidget {
  const DocLogoName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('/first_project/assets/svg/docdoc_logo.svg'),
        SizedBox(
          width: 10.w,
        ),
        const Text('DocDoc', style: CustomTextStyle.font24Black700Weight),
      ],
    );
  }
}
