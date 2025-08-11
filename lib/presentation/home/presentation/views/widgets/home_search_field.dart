import 'package:exam_app/core/common_widgets/custom_text_form_field.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      label: AppText.search,
      prefixIcon: Padding(
        padding: REdgeInsetsDirectional.only(start: 16, end: 2),
        child: Icon(Icons.search, size: 22.sp),
      ),
      borderRadius: 20,
    );
  }
}
