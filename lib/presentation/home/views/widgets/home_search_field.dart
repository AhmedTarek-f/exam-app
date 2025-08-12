import 'package:exam_app/core/common_widgets/custom_text_form_field.dart';
import 'package:exam_app/core/constants/app_icons.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      label: AppText.search,
      prefixIcon: Padding(
        padding: REdgeInsetsDirectional.only(start: 16, end: 2),
        child: SvgPicture.asset(AppIcons.search, fit: BoxFit.scaleDown),
      ),
      borderRadius: 20,
    );
  }
}
