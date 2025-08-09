import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/core/router/route_names.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(RouteNames.forgetPasswordEmail);
        },
        borderRadius: BorderRadius.circular(30.r),
        highlightColor: Theme.of(
          context,
        ).colorScheme.primary.withValues(alpha: 0.2),
        splashColor: Theme.of(
          context,
        ).colorScheme.primary.withValues(alpha: 0.2),
        child: RPadding(
          padding: const EdgeInsets.all(4),
          child: Text(
            AppText.forgetPassword,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              decoration: TextDecoration.underline,
              decorationColor: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
