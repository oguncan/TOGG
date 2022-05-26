import 'package:email_validator/email_validator.dart';

String? validatePassword(String value) {
  if(value.length == 0){
    return 'Please fill password field.';
  } else {
    return null;
  }
}

String? validateNameField(String value){
  if(value.length == 0){
    return 'Please fill username field.';
  } else {
    return null;
  }
}


