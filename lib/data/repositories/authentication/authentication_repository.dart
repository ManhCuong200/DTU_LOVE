<<<<<<< HEAD
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
=======
import 'package:firebase_auth/firebase_auth.dart';
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
<<<<<<< HEAD
import 'package:google_sign_in/google_sign_in.dart';
=======
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
import 'package:DTU_LOVE/features/authentication/screens/initial_information/initial_information_imports.dart';
import 'package:DTU_LOVE/features/authentication/screens/login/login_imports.dart';
import 'package:DTU_LOVE/features/authentication/screens/onboarding/onboarding_imports.dart';
import 'package:DTU_LOVE/features/authentication/screens/signup/signup_imports.dart';
<<<<<<< HEAD
import 'package:DTU_LOVE/navigation_menu.dart';
=======
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
import 'package:DTU_LOVE/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:DTU_LOVE/utils/exceptions/firebase_exceptions.dart';
import 'package:DTU_LOVE/utils/exceptions/format_exceptions.dart';
import 'package:DTU_LOVE/utils/exceptions/platform_exceptions.dart';

<<<<<<< HEAD
import '../../../utils/popups/loaders.dart';
import '../user/user_repository.dart';

=======
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
<<<<<<< HEAD
  final FirebaseFirestore _db = FirebaseFirestore.instance;
=======
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)

  // Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  // Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
<<<<<<< HEAD
    if (user != null) {
      if (user.emailVerified) {
        // Call the checkUserData method to check the user's data
        await checkUserData(user);
      } else {
        // If email is not verified
        Get.offAll(() => VerifyEmailScreen(email: user.email));
      }
    } else {
      // Handle for unauthenticated user
      deviceStorage.writeIfNull('isFirstTime', true);
      if (deviceStorage.read('isFirstTime') != true) {
        Get.offAll(() => const LoginScreen());
      } else {
        Get.offAll(() => const OnBoardingScreen());
      }
    }
  }

  // Method to check user data in Firestore
  Future<void> checkUserData(User user) async {
    try {
      // Retrieve the user document from Firestore
      final userDoc = await _db.collection('Users').doc(user.uid).get();

      if (userDoc.exists) {
        // Check if the `username` field exists in the document
        final data = userDoc.data();
        if (data != null && data.containsKey('Username') && data['Username'] != null && data['Username'].isNotEmpty) {
          // If `Username` exists, navigate to NavigationMenu
          Get.offAll(() => const NavigationMenu());
        } else {
          // If `Username` does not exist, navigate to InitialNamePage
          Get.offAll(() => const InitialNamePage());
        }
      } else {
        // If user document doesn't exist, navigate to InitialNamePage
        Get.offAll(() => const InitialNamePage());
      }
    } catch (e) {
      // Handle errors if any
      TLoaders.errorSnackBar(title: 'Error', message: 'An error occurred while checking user data.');
    }
  }


/*------------------------------- Email & Password Sign In -------------------------------*/
  // [EmailAuthentication] - Login
  Future<UserCredential> loginWithEmailPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

=======

    if (user != null) {
      if (!user.emailVerified) {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }
    // Local Storage
    deviceStorage.writeIfNull('isFirstTime', true);
    // Check if it's the first time launching the app
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

// /*------------------------------- Email & Password Sign In -------------------------------*/
//   // [EmailAuthentication] - Sign In
//   Future<UserCredential> loginWithEmailPassword(String email, String password) async {
//     try {
//       return await _auth.signInWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       throw TFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again!';
//     }
//   }
//
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
  // [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  // [EmailAuthentication] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

<<<<<<< HEAD
  // [EmailAuthentication] - Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  // [ReAuthenticate] - ReAuthenticate User
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      // Create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

/*------------------------------- Federated identity & social sign in -------------------------------*/

  // [GoogleAuthentication] - Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow (kich hoat luong xac thuc)
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once sign in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Some thing went wrong: $e');
      return null;
    }
  }

  // [FacebookAuthentication] - Facebook

/*------------------------------- End identity & social sign in -------------------------------*/
=======
//
//   // [EmailAuthentication] - Forget Password
//   Future<void> sendPasswordResetEmail(String email) async {
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//     } on FirebaseAuthException catch (e) {
//       throw TFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again!';
//     }
//   }
//
//   // [ReAuthenticate] - ReAuthenticate User
//   Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
//     try {
//       // Create a credential
//       AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
//
//       // ReAuthenticate
//       await _auth.currentUser!.reauthenticateWithCredential(credential);
//     } on FirebaseAuthException catch (e) {
//       throw TFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again!';
//     }
//   }
//
// /*------------------------------- Federated identity & social sign in -------------------------------*/
//
//   // [GoogleAuthentication] - Google
//   Future<UserCredential?> signInWithGoogle() async {
//     try {
//       // Trigger the authentication flow (kich hoat luong xac thuc)
//       final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
//
//       // Obtain the auth details from the request
//       final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
//
//       // Create a new credential
//       final credentials = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );
//
//       // Once sign in, return the UserCredential
//       return await _auth.signInWithCredential(credentials);
//     } on FirebaseAuthException catch (e) {
//       throw TFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       if (kDebugMode) print('Some thing went wrong: $e');
//       return null;
//     }
//   }
//
//   // [FacebookAuthentication] - Facebook
//
// /*------------------------------- End identity & social sign in -------------------------------*/
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)

  // [LogoutUser] - Valid for any authentication
  Future<void> logout() async {
    try {
      // await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
<<<<<<< HEAD
  }

  // [DeleteUser] - Remove user Auth and Firestore account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
=======
//   }
//
//   // [DeleteUser] - Remove user Auth and Firestore account
//   // Future<void> deleteAccount() async {
//   //   try {
//   //     await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
//   //     await _auth.currentUser?.delete();
//   //     Get.offAll(() => const LoginScreen());
//   //   } on FirebaseAuthException catch (e) {
//   //     throw TFirebaseAuthException(e.code).message;
//   //   } on FirebaseException catch (e) {
//   //     throw TFirebaseException(e.code).message;
//   //   } on FormatException catch (_) {
//   //     throw const TFormatException();
//   //   } on PlatformException catch (e) {
//   //     throw TPlatformException(e.code).message;
//   //   } catch (e) {
//   //     throw 'Something went wrong. Please try again!';
//   //   }
//   // }
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
  }
}
