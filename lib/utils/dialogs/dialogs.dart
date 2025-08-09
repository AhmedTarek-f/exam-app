import 'package:exam_app/core/common_widgets/custom_elevated_button.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/utils/dialogs/custom_dialog_content.dart';
import 'package:flutter/material.dart';

abstract class Dialogs {
  static customDialog({
    required BuildContext context,
    List<Widget>? actions,
    Widget? content,
  }) {
    return showDialog(
      context: context,
      builder: (context) =>
          CustomDialogContent(content: content, actions: actions),
    );
  }

  static startQuiz({
    required BuildContext context,
    required void Function()? onStart,
  }) {
    return customDialog(
      context: context,
      content: Text(
        AppText.startQuizMessage,
        style: Theme.of(context).textTheme.labelMedium,
        textAlign: TextAlign.center,
      ),
      actions: [
        CustomElevatedButton(onPressed: onStart, buttonTitle: AppText.start),
      ],
    );
  }
}
