enum LoginType {
  apple,
  google,
}

// extension LoginTypeExtension on LoginType {
//   VerifyStatus get toVerifyStatus {
//     switch (this) {
//       case LoginType.apple:
//         return this.(
//           isAppleVerified: true,
//         );

//       case LoginType.google:
//         return VerifyStatus.copyWith(
//           isGoogleVerified: true,
//           isEmailVerified: true,
//         );
//     }
//   }
// }
