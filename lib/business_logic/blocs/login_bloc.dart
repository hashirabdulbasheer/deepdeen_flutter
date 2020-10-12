import 'package:rxdart/rxdart.dart';
import '../../business_logic/states/login_state.dart';
import 'dart:async';
import 'validators.dart';
import 'base_bloc.dart';

class DeepDeenLoginBloc extends Object with DeepDeenBlocValidators implements DeepDeenBaseBloc {
  final DeepDeenLoginState _loginState = DeepDeenLoginState();

  /// input text field controller
  final _textFieldController = BehaviorSubject<String>();

  /// circular loading progress indicator controller
  final _loadingController = BehaviorSubject<bool>();

  /// enable/disable the submit button
  final _submitController = BehaviorSubject<bool>();

  Stream<String> get textFieldStream =>
      _textFieldController.stream.transform(isPasswordMode() ? passwordValidator : emailValidator);

  Stream<bool> get loadingStream => _loadingController.stream;

  Stream<bool> get submitStream => _submitController.stream;

  /// text changed callback from textfield
  Function(String) get textFieldChanged {
    // not command but text mode, ignore commands here
    String value = _textFieldController.value;
    if (isPasswordMode()) {
      _loginState.password = value;
    } else {
      _loginState.email = value;
    }
    _handleSubmitButton();
    return _textFieldController.sink.add;
  }

  showProgress() {
    _loadingController.add(true);
  }

  hideProgress() {
    _loadingController.add(false);
  }

  nextMode() {
    _loginState.isPasswordMode = true;
    _textFieldController.value = "";
  }

  isPasswordMode() => _loginState.isPasswordMode;

  getEmail() => _loginState.email;

  getPassword() => _loginState.password;

  isValid() => _loginState.isValid();

  _handleSubmitButton() {
    if (isPasswordMode()) {
      // Password mode : Enable button if valid password
      if (_loginState.password != null) {
        _submitController.add(true);
      } else {
        _submitController.add(false);
      }
    } else {
      // Email mode : Enable button if valid email
      if (_loginState.email != null) {
        _submitController.add(true);
      } else {
        _submitController.add(false);
      }
    }
  }

  @override
  void dispose() {
    _textFieldController?.close();
    _loadingController?.close();
    _submitController?.close();
  }
}
