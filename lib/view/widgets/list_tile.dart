import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectoneuniversity/core/constants/colors.dart';

import '../../core/constants/text_styles.dart';

class ListTiles extends StatelessWidget {
  final IconData? leadingIcon;
  final IconData trailingIcon;
  final String listText;

  const ListTiles(
      {super.key,
      required this.leadingIcon,
      required this.trailingIcon,
      required this.listText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: ListTile(
        trailing: Icon(
          trailingIcon,
          size: 18.sp,
        ),
        title: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
          child: Text(listText, style: TextStyles.w50013(context)),
        ),
      ),
    );
  }
}
