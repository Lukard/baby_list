import 'package:flutter_test/flutter_test.dart';
import 'package:baby_list/feature/signup/domain/usecase/email_validator.dart';

void main() {
  test('when valid email should return true', () {
    bool result = "test@test.test".isEmail();

    expect(result, true);
  });

  test('when NO valid email should return false', () {
    bool result = "whatever".isEmail();

    expect(result, false);
  });
}
