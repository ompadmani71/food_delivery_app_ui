// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../utlits/app_constant.dart';
//
// class CustomTextFiled extends StatelessWidget {
//   TextEditingController? controller;
//   FocusNode? focusNode;
//   String? label;
//   String? hint;
//   Color? fillColor;
//   bool? filled;
//   TextStyle? hintStyle;
//   TextInputType inputType;
//   bool isPassword;
//   bool readOnly;
//   Widget? suffixIcon;
//   Widget? prefixIcon;
//   Function? onTap;
//   Function? onChange;
//   EdgeInsetsGeometry? padding;
//   int? maxLength;
//
//   CustomTextFiled({
//     this.controller,
//     this.focusNode,
//     this.label,
//     this.hintStyle,
//     this.filled = false,
//     this.hint,
//     this.fillColor,
//     this.inputType = TextInputType.text,
//     this.isPassword = false,
//     this.readOnly = false,
//     this.suffixIcon,
//     this.prefixIcon,
//     this.onTap,
//     this.padding,
//     this.onChange,
//     this.maxLength
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 5.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           SizedBox(
//             width: 60.w,
//             child: Text(label ?? "",
//                 style: TextStyle(fontSize: 10.sp, color: AppColors.font,fontWeight: FontWeight.w400)),
//           ),
//           SizedBox(
//             width: 10.w,
//           ),
//           Expanded(
//             child: TextField(
//               controller: controller,
//               obscureText: isPassword,
//               maxLength: maxLength,
//               decoration: InputDecoration(
//                 hintText: hint,
//                 hintStyle: hintStyle ??
//                     TextStyle(fontSize: 14.sp, color: AppColors.greyContainer),
//                 border: UnderlineInputBorder(
//                     borderSide: BorderSide(color: AppColors.textFiledBorder)),
//                 filled: filled,
//                 fillColor: fillColor,
//                 isDense: true,
//                 counterText: "",
//                 contentPadding: padding ??
//                     EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
//                 suffix: suffixIcon,
//                 prefix: prefixIcon,
//               ),
//               style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
//               keyboardType: inputType,
//               onTap: () {
//                 if (onTap != null) {
//                   onTap!();
//                 }
//               },
//               focusNode: focusNode,
//               readOnly: readOnly,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
