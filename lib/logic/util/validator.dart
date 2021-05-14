import 'package:flutter/material.dart';

class Validator{

  // BACKS //

  static FormFieldValidator<String> _validateRegex(String regex, String errorMsg, bool not) {
    return (value) {
      if (RegExp(regex).hasMatch(value))
        return not? errorMsg:null;
      return not? null:errorMsg;
    };
  }

  static FormFieldValidator<String> validateRegex(String regex, String errorMsg) {
    return _validateRegex(regex, errorMsg, false);
  }

  static FormFieldValidator<String> validateInvertRegex(String regex, String errorMsg) {
    return _validateRegex(regex, errorMsg, true);
  }


  static FormFieldValidator<String> validate(List<FormFieldValidator<String>> validators) {
    return (value) {
      value = value.trim();
      for (final validator in validators) {
        final validateMsg = validator(value);
        if (validateMsg != null)
          return validateMsg;
      }
      return null;
    };
  }

  //BACKS ENDS//

  // VALIDATORS //

  static FormFieldValidator<String> validateEquality(String string, String errorMsg) {
    return (value){
      if(value==string){
        return null;
      }else{
        return errorMsg;
      }
    };
  }
  
  static FormFieldValidator<String> validateEmail() {
    return validate([
      validateRegex(r".+", "Email should not be empty"),
      validateRegex(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)",
        "Invalid Email")
    ]);
  }

  static FormFieldValidator<String> validateFullname() {
    return validate([
      validateRegex(r".+", "Name should not be empty"),
    ]);
  }

  static FormFieldValidator<String> validatePassword(bool isLogin) {
    if(isLogin){
      return validateRegex(r".+", "Password should not be empty");
    }

    return validate([
      validateRegex(r".+", "Password should not be empty"),
      validateRegex(r".{6}", "Password should be minimum 6 characters"),
      // validateRegex(r"^.{6,12}$", "Password should be maximum 12 characters"),
      validateRegex(r"[A-Z]+", "Password should contain an uppercase character"),
      validateRegex(r"[a-z]+", "Password should contain a lowercase character"),
      validateRegex(r"[0-9]+", "Password should contain a digit"),
      // validateRegex(r"[\.!$%&\'*+/=?^_`{|}~\-:;@]+", "Password should contain minimum one of !\$%&\'*+/=?^_`{|}~\-:;@"),
      validateInvertRegex(r"[#]+", "Password should not contain #"),
    ]);
  }

  static FormFieldValidator<String> validateConfirmPassword(String password) {
    return validate([
      validateRegex(r".+", "Confirm password should not be empty"),
      validateEquality(password, "Confirm password doesn't mactch")
    ]);
  }

  static FormFieldValidator<String> validateUsername() {
    return validate([
      validateRegex(r".+", "Username should not be empty"),
      validateRegex(r"^username$", "Username should be a username")
    ]);
  }

  // VALIDATOR ENDS //
}