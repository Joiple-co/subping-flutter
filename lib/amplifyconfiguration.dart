const amplifyconfig = ''' {
  "UserAgent": "aws-amplify-cli/2.0",
  "Version": "1.0",
  "auth": {
      "plugins": {
          "awsCognitoAuthPlugin": {
              "IdentityManager": {
                  "Default": {}
              },
              "CredentialsProvider": {
                  "CognitoIdentity": {
                      "Default": {
                          "PoolId": "ap-northeast-2:26866439-e0c5-4fb0-ac30-ebbdb11968ee",
                          "Region": "ap-northeast-2"
                      }
                  }
              },
              "CognitoUserPool": {
                  "Default": {
                      "PoolId": "ap-northeast-2_C7MK1k7XM",
                      "AppClientId": "7fhsls3gcvtu85ngdc1lksi296",
                      "AppClientSecret": "126odqton2tia6b30ukeaheiehs7mc6dk9u65t12o7sgma8l53mn",
                      "Region": "ap-northeast-2"
                  }
              },
              "Auth": {
                  "Default": {
                      "authenticationFlowType": "USER_SRP_AUTH"
                  }
              }
          }
      }
  },
}''';
