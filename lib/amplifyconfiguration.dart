String getAmplifyCongig(String stage) {
  if (stage == "dev") {
    return devAmplifyconfig;
  } else {
    return devAmplifyconfig;
  }
}

const devAmplifyconfig = ''' {
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
                          "PoolId": "ap-northeast-2:399e170b-7fa8-47d7-b5b8-1b4d1a8dd55e",
                          "Region": "ap-northeast-2"
                      }
                  }
              },
              "CognitoUserPool": {
                  "Default": {
                      "PoolId": "ap-northeast-2_VzCrSsELb",
                      "AppClientId": "4p168n12vp9vraftlg9d29hlf2",
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
  "api": {
        "plugins": {
            "awsAPIPlugin": {
                "auth": {
                    "endpointType": "REST",
                    "endpoint": "https://6d6943fwn7.execute-api.ap-northeast-2.amazonaws.com/dev",
                    "region": "ap-northeast-2",
                    "authorizationType": "AWS_IAM"
                },
                "service": {
                    "endpointType": "REST",
                    "endpoint": "https://xh72dg6ad6.execute-api.ap-northeast-2.amazonaws.com/dev",
                    "region": "ap-northeast-2",
                    "authorizationType": "AWS_IAM"
                },
                "user": {
                  "endpointType": "REST",
                  "endpoint": "https://ceeynm3z5j.execute-api.ap-northeast-2.amazonaws.com/dev",
                  "region": "ap-northeast-2",
                  "authorizationType": "AWS_IAM"
                }
            }
        }
    },
  "storage": {
    "plugins": {
      "awsS3StoragePlugin": {
        "bucket": "subping-dev-user-upload",
        "region": "ap-northeast-2"
      }
    }
  }
}''';
