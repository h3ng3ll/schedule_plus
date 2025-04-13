import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  // final FirebaseAuthService _firebaseAuthService = FirebaseAuthService.instance;

  AuthCubit() : super(const AuthState()) {
    // if (_firebaseAuthService.isAuthorized()) {
    //   emit(
    //     state.copyWith(
    //       status: AuthStatus.authorized,
    //       user: _firebaseAuthService.currentUser,
    //     ),
    //   );
    // }
  }

  void signAnonymously() async {
    // try {
    //   emit(
    //     state.copyWith(
    //       status: AuthStatus.loading,
    //     ),
    //   );
    //   final UserCredential userCredential =
    //       await _firebaseAuthService.signInAnonymously();
    //   emit(
    //     state.copyWith(
    //       user: userCredential.user,
    //       status: AuthStatus.authorized,
    //     ),
    //   );
    // } catch (e) {
    //   debugPrint(e.toString());
    //   emit(
    //     state.copyWith(
    //       status: AuthStatus.failed,
    //       errorMessage: e.toString(),
    //     ),
    //   );
    //   rethrow;
    // }
  }

  Future<bool> signInViaPhone(String phoneNumber) async {
    // try {
    //   emit(
    //     state.copyWith(
    //       status: AuthStatus.loading,
    //     ),
    //   );
    //   final Completer<bool> completer = Completer<bool>();
    //
    //   await _firebaseAuthService.verifyPhoneNumber(
    //     phoneNumber: phoneNumber,
    //     verificationCompleted: (PhoneAuthCredential credential) async {
    //       /// Android only devices
    //       final credentials =
    //           await _firebaseAuthService.signInWithCredentials(credential);
    //       emit(
    //         state.copyWith(
    //           user: credentials.user,
    //         ),
    //       );
    //       completer.complete(true);
    //     },
    //     verificationFailed: (FirebaseAuthException e) {
    //       emit(
    //         state.copyWith(
    //           status: AuthStatus.failed,
    //           errorMessage: e.toString(),
    //         ),
    //       );
    //       completer.complete(false);
    //     },
    //     codeSent: (String verificationId, int? resendToken) async {
    //       /// resendToken always null on IOS
    //       emit(
    //         state.copyWith(
    //           verificationId: verificationId,
    //           resendToken: resendToken,
    //         ),
    //       );
    //       completer.complete(true);
    //     },
    //     codeAutoRetrievalTimeout: (String verificationId) {},
    //   );
    //
    //   final res =  await completer.future;
    //   emit(
    //     state.copyWith(
    //       status: AuthStatus.initial,
    //     ),
    //   );
    //   return res;
    // } catch (e) {
    //   debugPrint(e.toString());
    //   emit(
    //     state.copyWith(
    //       status: AuthStatus.failed,
    //       errorMessage: e.toString(),
    //     ),
    //   );
    //   return false;
    // }
    return false;
  }

  Future<bool> verifySmsCode(String smsCode) async {
  //   try {
  //     emit(
  //       state.copyWith(
  //         status: AuthStatus.loading,
  //       ),
  //     );
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: state.verificationId!,
  //       smsCode: smsCode,
  //     );
  //     final userCredential = await _firebaseAuthService.signInWithCredentials(
  //       credential,
  //     );
  //     emit(
  //       state.copyWith(
  //         status: AuthStatus.authorized,
  //         user: userCredential.user,
  //       ),
  //     );
  //     return true;
  //   } catch (e) {
  //     emit(
  //       state.copyWith(
  //         status: AuthStatus.failed,
  //         errorMessage: e.toString(),
  //       ),
  //     );
  //   }
  //   return false;
  // }
  //
  // Future<void> signOut() async {
  //   try {
  //     emit(
  //       state.copyWith(
  //         status: AuthStatus.loading,
  //       ),
  //     );
  //
  //     await _firebaseAuthService.signOut();
  //
  //     emit(
  //       state.copyWith(
  //         user: null,
  //         status: AuthStatus.initial,
  //       ),
  //     );
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     emit(
  //       state.copyWith(
  //         status: AuthStatus.failed,
  //         errorMessage: e.toString(),
  //       ),
  //     );
  //     rethrow;
  //   }
    return false;
  }
}
