// import 'package:flutter/material.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import 'package:nftappdesign/globale.dart';

// Widget phoneForm({
//   required TextEditingController textEditingController,
//   required PhoneNumber number,
//   required Map changeData,
//   String hintText = "",
// }) {
//   print("asdasdasaddasaaaaaaaaatextedit " + textEditingController.text);
//   print("asdasdasaddasaaaaaaaaanumber " + number.phoneNumber.toString());

//   try {
//     number = PhoneNumber(
//       isoCode: userStore.userData["phone_number_info"]["isoCode"],
//       dialCode: userStore.userData["phone_number_info"]["dialCode"],
//     );
//   } catch (e) {
//     number = PhoneNumber(
//       isoCode: userStore.signInData["phone_number_info"]["isoCode"],
//       dialCode: userStore.signInData["phone_number_info"]["dialCode"],
//     );
//   }

//   return Container(
//     height: 60,
//     padding: const EdgeInsets.symmetric(horizontal: 10),
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.white),
//       borderRadius: BorderRadius.circular(20),
//       color: Colors.white.withOpacity(0.23),
//     ),
//     child: InternationalPhoneNumberInput(
//       autoFocus: false,
//       isEnabled: true,
//       textAlign: TextAlign.left,
//       textAlignVertical: TextAlignVertical.center,
//       spaceBetweenSelectorAndTextField: 0,
//       hintText: hintText,
//       onInputChanged: (number) {
//         // changeData["phone_number"] = "${number.phoneNumber}";
//         changeData["phone_number_info"]["isoCode"] = number.isoCode;
//         changeData["phone_number_info"]["dialCode"] = number.dialCode;
//       },
//       autoFocusSearch: true,
//       selectorConfig: const SelectorConfig(
//         setSelectorButtonAsPrefixIcon: true,
//         trailingSpace: false,
//         leadingPadding: 10,
//         selectorType: PhoneInputSelectorType.DIALOG,
//       ),
//       countrySelectorScrollControlled: true,
//       ignoreBlank: false,
//       autoValidateMode: AutovalidateMode.disabled,
//       selectorTextStyle: const TextStyle(color: Colors.white),
//       initialValue: number,
//       textFieldController: textEditingController,
//       formatInput: false,
//       keyboardType:
//           const TextInputType.numberWithOptions(signed: true, decimal: true),
//       inputBorder: const OutlineInputBorder(),
//       onSaved: (PhoneNumber number) {},
//       textStyle: const TextStyle(color: Colors.white, letterSpacing: 1),
//     ),
//   );
// }
