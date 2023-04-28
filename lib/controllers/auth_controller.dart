import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_finder/screens/main_screen.dart';

import '../services/firebase_auth_service.dart';

class AuthController extends GetxController {
  FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  final Rxn<User> _firebaseUser = Rxn<User>();

  String? get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_firebaseAuthService.onAuthStateChanged);
    // Redirect user to home screen after authentication
    ever(_firebaseUser, (User? user) {
      if (user != null) {
        Get.offAll(() => MainScreen());
      }
    });
  }

  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuthService.signUpWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message!, snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message!, snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await _firebaseAuthService.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message!, snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuthService.signOut();
  }
}
