import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSubjectWidget extends StatelessWidget {
  final String title;
  final String image;

  const CustomSubjectWidget({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadows: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.12),
            spreadRadius: 5,
            blurRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          RPadding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(image),
          ),
          const RSizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
