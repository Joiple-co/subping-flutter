import 'package:amazon_cognito_identity_dart_2/cognito.dart';

class User {
  CognitoUserPool userPool =
      CognitoUserPool("ap-northeast-2_C7MK1k7XM", "2r2una4i3ad2igubdph0dro59b");
  CognitoUser user;
}
