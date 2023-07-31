import 'package:biatest_domain/utils/validations/email_validator.dart';
import 'package:biatest_domain/utils/validations/mobile_number_validator.dart';
import 'package:biatest_domain/utils/validations/name_validator.dart';
import 'package:biatest_domain/utils/validations/otp_validator.dart';
import 'package:biatest_domain/utils/validations/password_validator.dart';
import 'package:biatest_domain/utils/validations/referral_code_validator.dart';
import 'package:biatest_domain/utils/validations/validation_facade.dart';

mixin ValidatorModule {
  EmailValidator get emailValidator {
    return EmailValidator();
  }

  PasswordValidator get passwordValidator {
    return PasswordValidator();
  }

  NameValidator get nameValidator {
    return NameValidator();
  }

  MobileNumberValidator get mobileNumberValidator {
    return MobileNumberValidator();
  }

  ReferralCodeValidator get referralCodeValidator {
    return ReferralCodeValidator();
  }

  OtpValidator get otpValidator {
    return OtpValidator();
  }

  ValidationFacade get validator {
    return ValidationFacade(
      emailValidator: emailValidator,
      passwordValidator: passwordValidator,
      nameValidator: nameValidator,
      mobileNumberValidator: mobileNumberValidator,
      referralCodeValidator: referralCodeValidator,
      otpValidator: otpValidator,
    );
  }
}
