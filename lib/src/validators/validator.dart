import 'dart:async';

class Validator {
  // Validate Name

  // final validateName = StreamTransformer<String, String>.fromHandlers(
  //   handleData: (name, sink) {
  //     if (name.length >= 4) {
  //       sink.add(name);
  //     } else {
  //       sink.addError('Name should be at least 4 character');
  //     }
  //   },
  // );
  // Validate Email
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains('@')) {
        sink.add(email);
      } else {
        sink.addError('Please enter valid email');
      }
    },
  );
  // Validate Password

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 6) {
        sink.add(password);
      } else {
        sink.addError('Password should be at least 6 character');
      }
    },
  );
}
