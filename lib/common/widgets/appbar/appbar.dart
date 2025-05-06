import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:DTU_LOVE/utils/constants/colors.dart';
import 'package:DTU_LOVE/utils/constants/sizes.dart';
import 'package:DTU_LOVE/utils/device/device_utility.dart';
import 'package:DTU_LOVE/utils/helpers/helper_functions.dart';

class TAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TAppbar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
<<<<<<< HEAD
    this.isCenterTitle = false,
=======
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
<<<<<<< HEAD
  final bool isCenterTitle;
=======
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
<<<<<<< HEAD
                onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left, color: TColors.primary))
=======
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left, color: TColors.primary))
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
            : leadingIcon != null
                ? IconButton(onPressed: () => leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
<<<<<<< HEAD
        centerTitle: isCenterTitle,
=======
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
