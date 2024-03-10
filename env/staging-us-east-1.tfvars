aws_region = "us-east-1"
env        = "staging"

# Lambda arns
pre_sign_up = "arn:aws:lambda:us-east-1:036922805605:function:PreSignUpLambdaFunction"
define_auth_challenge = "arn:aws:lambda:us-east-1:036922805605:function:DefineChallengeLambdaFunction"
create_auth_challenge = "arn:aws:lambda:us-east-1:036922805605:function:CreateChallengeLambdaFunction"
verify_auth_challenge = "arn:aws:lambda:us-east-1:036922805605:function:VerifyAuthChallengeLambdaFunction"
