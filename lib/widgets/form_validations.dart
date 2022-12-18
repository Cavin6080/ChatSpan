import 'package:form_field_validator/form_field_validator.dart';

class FormValidations {
  //put validation here
  String? requiredField(String? value, {String? errorText}) {
    if (value!.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String? requiredDateTimeField(DateTime? value, {String? errorText}) {
    print("requiredDateTimeField $value");
    if (value == null) {
      return 'Field is required';
    }
    return null;
  }

  PatternValidator usernameValidateField() {
    return PatternValidator(r'^[a-zA-Z]+ [a-zA-Z]+$',
        errorText: "Please mention first name and last name");
  }

  PatternValidator nameValidateField() {
    return PatternValidator(r'^(?=.*?[a-zA-Z])[\w\h-]{3,50}$',
        errorText: "Name invalid");
  }

  PatternValidator passwordValidateField() {
    return PatternValidator(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}',
        errorText: "Minimum eight characters,"
            " at least one uppercase letter,"
            " one lowercase letter,"
            " one number and "
            "one special character");
  }

  MultiValidator validation(
      {required String type,
      required MultiValidator multiValidator,
      required bool isRequired}) {
    if (isRequired) {
      multiValidator.validators
          .add(RequiredValidator(errorText: "This field is required"));
    }

    switch (type) {
      case "password":
        multiValidator.validators.add(passwordValidateField());
        break;
      case "email":
        multiValidator.validators
            .add(EmailValidator(errorText: "Email is invalid"));
        break;
      case "username":
        multiValidator.validators.add(usernameValidateField());
        break;
      case "name":
        multiValidator.validators.add(nameValidateField());
        break;
    }
    return multiValidator;
  }
}
