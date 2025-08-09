import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/core/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonNotHaveAcc extends StatelessWidget {
  const DonNotHaveAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppText.donNotHaveAccount,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(RouteNames.signup);
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
              AppText.signup,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                decoration: TextDecoration.underline,
                decorationColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
