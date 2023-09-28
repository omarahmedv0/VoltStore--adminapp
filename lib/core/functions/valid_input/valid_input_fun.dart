// ignore_for_file: unused_element


import 'is_email.dart';
import 'is_phone.dart';


validInputFun(String? val, int min, int max, String type) {
  
 

  if (type == 'username') {
    if (val!.isEmpty) {
      return 'The field is empty';
    } else {
      if (val.length < min) {
        return '${'cannot less than'}$min';
      } else if (val.length > max) {
        return '${'cannot more than'}$max';
      }
    }
  }


  if (type == 'email') {
    if (val!.isEmpty) {
      return 'The field is empty';
    } else {
      if (isEmail(val)) {
        if (val.length < min) {
          return '${'cannot less than'}$min';
        } else if (val.length > max) {
          return '${'cannot more than'}$max';
        }
      } else {
        return 'invalid email';
      }
    }
  }

  if (type == 'phone') {
    if (val!.isEmpty) {
      return 'The field is empty';
    } else {
      if (isPhoneNoValid(val)) {
        if (val.length < min) {
          return '${'cannot less than'}$min';
        } else if (val.length > max) {
          return '${"cannot more than"}$max';
        }
      } else {
        return 'invalid number';
      }
    }
  }

  if (type == 'password') {
    if (val!.isEmpty) {
      return 'The field is empty';
    } else {
      if (val.length < min) {
        return '${'cannot less than'}$min';
      } else if (val.length > max) {
        return '${'cannot more than'}$max';
      }
    }
  }
}
