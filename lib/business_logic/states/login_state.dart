import '../../business_logic/misc/constants.dart';
import '../../business_logic/misc/utils.dart';

class DeepDeenLoginState {

  String _email, _password;

  String get email => _email;

  set email(String emailAddress) {
    if (DeepDeenUtils.isEmail(emailAddress)) {
      _email = emailAddress;
    } else {
      _email = null;
    }
  }

  String get password => _password;

  set password(String password) {
    if(password != null && password.length > DeepDeenConstants.PASSWORD_MIN_LENGTH) {
      _password = password;
    } else {
      _password = null;
    }
  }

  bool isPasswordMode = false;

  /// Validate the format of email address and password
  isValid() {
    if(_email == null) return false;
    if(_password == null) return false;
    if (_email.isEmpty || _password.isEmpty) {
      return false;
    }
    if (!DeepDeenUtils.isEmail(_email)) {
      return false;
    }
    if (_password.length < DeepDeenConstants.PASSWORD_MIN_LENGTH) {
      return false;
    }
    return true;
  }
}
