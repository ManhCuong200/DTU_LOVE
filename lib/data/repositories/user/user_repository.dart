import 'dart:io';
<<<<<<< HEAD
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:DTU_LOVE/data/repositories/authentication/authentication_repository.dart';
import 'package:DTU_LOVE/features/personalization/models/user_model.dart';
=======

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:DTU_LOVE/data/repositories/authentication/authentication_repository.dart';
import 'package:DTU_LOVE/features/authentication/models/user_model.dart';
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

<<<<<<< HEAD
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // Firestore instance
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Firebase Storage instance
  final FirebaseStorage _storage = FirebaseStorage.instance;


  // Save user data to Firestore
=======
// Repository class for user-related operations
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to Firestore
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

<<<<<<< HEAD
  // Fetch user details by user ID
=======
  // Function to fetch user details based on userID
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot =
          await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).get();
<<<<<<< HEAD

      if (documentSnapshot.exists) {
        // Return user data if exists
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        // Return empty if user not found
=======
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

<<<<<<< HEAD
  // Update user details in Firestore
=======
  // Function to update user data in firestore
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db.collection('Users').doc(updateUser.id).update(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

<<<<<<< HEAD
  // Update specific fields in Firestore
=======
  // Update any field in specific Users Collection
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

<<<<<<< HEAD
  // Delete user record from Firestore
=======
  // Function to remove user data from Firestore
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection('Users').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

<<<<<<< HEAD
  // Upload multiple images to Firebase Storage
=======
  // Upload image
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
  Future<List<String>> uploadImages(List<String> filePaths) async {
    List<String> uploadedUrls = [];
    for (String path in filePaths) {
      try {
        String fileName = path.split('/').last;
<<<<<<< HEAD
        Reference ref = _storage.ref().child('profile_photos/$fileName');
=======
        Reference ref = FirebaseStorage.instance.ref().child('profile_photos/$fileName');
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
        UploadTask uploadTask = ref.putFile(File(path));

        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();
<<<<<<< HEAD
        uploadedUrls.add(downloadUrl); // Collect uploaded URLs
=======
        uploadedUrls.add(downloadUrl);
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
      } catch (e) {
        throw Exception('Failed to upload $path: $e');
      }
    }
    return uploadedUrls;
  }
<<<<<<< HEAD

  // Upload a single profile image to Firebase
  Future<String> uploadProfileImage(String filePath) async {
    try {
      String fileName = filePath.split('/').last;
      Reference ref = _storage.ref('profile_photos/$fileName');
      TaskSnapshot snapshot = await ref.putFile(File(filePath));
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Update user data with the new image
      final user = await fetchUserDetails();
      user.profilePictures.add(downloadUrl);
      await updateUserDetails(user);

      return downloadUrl; // Return download URL
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Failed to upload the image. Please try again!';
    }
  }

  // Delete an image from Firebase Storage and Firestore
  Future<void> deleteProfileImage(String imageUrl) async {
    try {
      // Delete from storage
      await FirebaseStorage.instance.refFromURL(imageUrl).delete();

      // Remove the image from user data
      final user = await fetchUserDetails();
      user.profilePictures.remove(imageUrl);
      await updateUserDetails(user);
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Failed to delete the image. Please try again!';
    }
  }
=======
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
}
