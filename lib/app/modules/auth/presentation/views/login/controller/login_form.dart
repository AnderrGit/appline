import 'package:reactive_forms/reactive_forms.dart';

FormGroup createLoginForm() {
  return FormGroup({
    'email': FormControl<String>(
        validators: <Validator>[Validators.required, Validators.email],
        value: 'email_test@yopmail.com'),
    'password': FormControl<String>(
      validators: <Validator>[
        Validators.required,
        Validators.minLength(6),
      ],
      value: '123456',
    ),
  });
}
