import 'dart:async';

import 'package:sampeapp/business_logic/misc/constants.dart';
import 'package:sampeapp/business_logic/misc/strings.dart';
import 'package:sampeapp/business_logic/misc/utils.dart';

mixin DeepDeenBlocValidators {
  var emailValidator = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (DeepDeenUtils.isEmail(email)) {
      sink.add(email);
    } else {
      sink.addError(DeepDeenStrings.getErrorString("error_invalid_email"));
    }
  });

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
    if (password.length > DeepDeenConstants.PASSWORD_MIN_LENGTH) {
      sink.add(password);
    } else {
      sink.addError(DeepDeenStrings.getErrorString("error_invalid_password"));
    }
  });
}
