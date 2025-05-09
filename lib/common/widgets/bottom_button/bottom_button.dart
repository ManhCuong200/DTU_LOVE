import 'package:flutter/material.dart';

class TBottomButton extends StatelessWidget {
  const TBottomButton({
    super.key,
    required this.onPressed,
    required this.textButton,
  });

  final VoidCallback? onPressed;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
<<<<<<< HEAD
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),

        ),
        onPressed: onPressed,
        child: Text(textButton, style: const TextStyle(fontWeight: FontWeight.bold)),
=======
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        ),
        onPressed: onPressed,
        child:  Text(textButton, style: const TextStyle(fontWeight: FontWeight.bold)),
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
      ),
    );
  }
}
