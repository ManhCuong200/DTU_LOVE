<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:DTU_LOVE/common/widgets/loaders/shimmer.dart';

import '../../../features/personalization/controller/user_controller.dart';
import '../../../utils/constants/colors.dart';
=======

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
import '../images/t_circular_image.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final controller = Get.put(UserController());
    return Obx(() {
      if (controller.profileLoading.value) {
        // Display A Shimmer Loader While User Profile being loader
        return const TShimmerEffect(width: 80, height: 20);
      }
      return ListTile(
        // Image
        leading: TCircularImage(
          width: 50,
          height: 50,
          padding: 0,
          isNetworkImage: true,
          image: controller.user.value.profilePictures[0],
        ),

        // Name
        title: Text(
          controller.user.value.username,
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
        ),

        // Email
        subtitle: Text(
          controller.user.value.email,
          style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
        ),

        // Edit
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: TColors.white,
          ),
        ),
      );
    });
=======
    return ListTile(

      // Image
      leading: const TCircularImage(
          image: TImages.user, width: 50, height: 50, padding: 0),

      // Name
      title: Text(
        'Nguyễn Gia Bảo',
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
      ),

      // Email
      subtitle: Text(
        'ngbao08052003@gmail.com',
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),

      // Edit
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
      ),
    );
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
  }
}
