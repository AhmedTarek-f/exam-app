import 'package:exam_app/core/constants/app_images.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_subject_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    final subjects = [
      {'title': AppText.language, 'image': AppImages.language},
      {'title': AppText.math, 'image': AppImages.math},
      {'title': AppText.art, 'image': AppImages.art},
      {'title': AppText.science, 'image': AppImages.science},
    ];

    return RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const RSizedBox(height: 16),
          TextField(
            controller: searchController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: AppText.search,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: const BorderSide(width: 1, color: Colors.black),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).hintColor,
                ),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          const RSizedBox(height: 16),
          Text(
            AppText.browseBySubject,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const RSizedBox(height: 16),
          ...subjects.map(
            (subject) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomSubjectWidget(
                title: subject['title']!,
                image: subject['image']!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
