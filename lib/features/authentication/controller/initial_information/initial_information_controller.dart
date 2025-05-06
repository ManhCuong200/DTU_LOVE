import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:DTU_LOVE/data/repositories/user/user_repository.dart';
import 'package:DTU_LOVE/features/authentication/screens/initial_information/initial_information_imports.dart';
import 'package:DTU_LOVE/generated/assets.dart';
import 'package:DTU_LOVE/navigation_menu.dart';
import 'package:DTU_LOVE/utils/helpers/network_manager.dart';
import 'package:DTU_LOVE/utils/popups/full_screen_loader.dart';
import 'package:DTU_LOVE/utils/popups/loaders.dart';
import 'package:DTU_LOVE/utils/validators/validation.dart';

class InitialInformationController extends GetxController {
  static InitialInformationController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  final userName = TextEditingController();
  final dateOfBirth = TextEditingController();
  final selectedGender = ''.obs;
<<<<<<< HEAD
  final selectedWantSeeing = ''.obs;
=======
  final selectWantSeeing = ''.obs;
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
  final newPhotos = <String>[].obs;

  // Temporary Model To Save information
  Map<String, dynamic> userTempData = {};

  // Update Gender
  void updateGender(String gender) {
    selectedGender.value = gender;
  }

  // Update WantSeeing
  void updateWantSeeing(String wantSeeing) {
<<<<<<< HEAD
    selectedWantSeeing.value = wantSeeing;
=======
    selectWantSeeing.value = wantSeeing;
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
  }

  // Pictures
  // -- Add Picture
  void addPhotos(List<String> photos) {
    newPhotos.addAll(photos);
  }

  // -- Remove Picture
  void removePhoto(int index) {
    newPhotos.removeAt(index);
  }

  // The Function Stores A Temporary Name
  void saveName() {
    // Validate name
    String? validationError = TValidator.validateEmptyText('Name', userName.text.trim());

    if (validationError != null) {
      TLoaders.errorSnackBar(
        title: 'Name not entered',
        message: validationError,
      );
      return;
    }

    // If validation is passed, save name and navigate to the next page
    userTempData['Username'] = userName.text.trim();
    Get.to(() => const InitialBirthdayPage());
  }

  // The Function Stores A Temporary Birthday
  void saveBirthday() {
    // Validate birthday
    String? validationError = TValidator.validateBirthday(dateOfBirth.text.trim());

    if (validationError != null) {
      TLoaders.errorSnackBar(
        title: 'Invalid Birthday',
        message: validationError,
      );
      return;
    }

    // If validation is passed, save birthday and navigate to the next page
    userTempData['DateOfBirth'] = dateOfBirth.text.trim();
    Get.to(() => const InitialGenderPage());
  }

  // The Function Stores A Temporary Gender
  void saveGender() {
    if (selectedGender.value.isEmpty) {
      TLoaders.errorSnackBar(
        title: 'Gender not selected',
        message: 'Please select a gender before proceeding!',
      );
      return;
    }
    userTempData['Gender'] = selectedGender.value;
    Get.to(() => const InitialInterestedPage());
  }

  // The Function Stores A Temporary Gender
  void saveWantSeeing() {
<<<<<<< HEAD
    if (selectedWantSeeing.value.isEmpty) {
=======
    if (selectWantSeeing.value.isEmpty) {
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
      TLoaders.errorSnackBar(
        title: 'Who are you interested in seeing is not selected',
        message: 'Please select interested in seeing before proceeding!',
      );
      return;
    }
<<<<<<< HEAD
    userTempData['WantSeeing'] = selectedWantSeeing.value;
=======
    userTempData['WantSeeing'] = selectWantSeeing.value;
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
    Get.to(() => const InitialRecentPicturePage());
  }

  // The Function Stores A Temporary List of Photos
  Future<void> saveImages() async {
    try {
<<<<<<< HEAD
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        Assets.animations141594AnimationOfDocer,
      );

      List<String> uploadedUrls = await userRepository.uploadImages(newPhotos);

      userTempData['ProfilePictures'] = uploadedUrls;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Upload Failed', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
=======
      if (newPhotos.isNotEmpty) {
        // Upload all images to Firebase Storage
        List<String> uploadedUrls = await userRepository.uploadImages(newPhotos);

        // Save the URLs in the temporary user data map
        userTempData['ProfilePictures'] = uploadedUrls;
      }
    } catch (e) {
      // Handle the exception
      TLoaders.errorSnackBar(title: 'Upload Failed', message: e.toString());
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
    }
  }

  // Update Initial Information
  Future<void> updateInitialInformation() async {
    try {
<<<<<<< HEAD
=======

      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', Assets.animations141594AnimationOfDocer);

>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
      // Check Internet Connectivity
      final isConnect = await NetworkManager.instance.isConnected();
      if (!isConnect) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

<<<<<<< HEAD
=======
      // Save user name
      saveName();

      // Save birthday
      saveBirthday();

      // Save gender
      saveGender();

      // Save wantSeeing
      saveWantSeeing();

      // Save images
      await saveImages();

>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
      // Update user data in Firebase Firestore
      await userRepository.updateSingleField(userTempData);

      // Show Success Message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your information base has been saved',
      );

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Move To NavigationMenu
      Get.to(() => const NavigationMenu());
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Some Generic Error To The User
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
