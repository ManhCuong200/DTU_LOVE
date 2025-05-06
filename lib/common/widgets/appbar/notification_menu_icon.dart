import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:iconsax/iconsax.dart';
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)

class TActionAppbarIcon extends StatelessWidget {
  const TActionAppbarIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
    required this.icon,
  });

  final VoidCallback onPressed;
  final Color? iconColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 26,
        color: iconColor,
      ),
    );
  }
}
