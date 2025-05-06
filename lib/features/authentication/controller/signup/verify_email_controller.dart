import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:DTU_LOVE/common/widgets/success_screen/success_screen.dart';
import 'package:DTU_LOVE/data/repositories/authentication/authentication_repository.dart';
<<<<<<< HEAD
=======
import 'package:DTU_LOVE/features/authentication/screens/initial_information/initial_information_imports.dart';
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
import 'package:DTU_LOVE/generated/assets.dart';
import 'package:DTU_LOVE/utils/constants/text_strings.dart';
import 'package:DTU_LOVE/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Send email whenever verify screen appears & set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email Sent', message: 'Please Check your inbox and verify your email.');
    } catch (e) {
<<<<<<< HEAD
      // TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
=======
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
    }
  }

  // Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            animation: Assets.animations72462CheckRegister,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
<<<<<<< HEAD
            onPressed: () async {
              AuthenticationRepository.instance.screenRedirect();
            },
=======
            onPressed: () => Get.to(const InitialNamePage()),
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
          ),
        );
      }
    });
  }

  // Manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          animation: Assets.animations72462CheckRegister,
          title: TTexts.yourAccountCreatedTitle,
          subTitle: TTexts.yourAccountCreatedSubTitle,
<<<<<<< HEAD
          onPressed: () async {
            AuthenticationRepository.instance.screenRedirect();
          },
=======
          onPressed: () => Get.to(const InitialNamePage()),
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
        ),
      );
    }
  }
}
