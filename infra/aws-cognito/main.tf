resource "aws_cognito_user_pool" "tech_challenge_user_pool" {
  name = "tech_challenge_user_pool"

  lambda_config {
    create_auth_challenge = var.create_auth_challenge
    define_auth_challenge = var.define_auth_challenge
    pre_sign_up = var.pre_sign_up
    verify_auth_challenge_response = var.verify_auth_challenge
  }
  
}

# create a user pool client for login via CUSTOM AUTH FLOW

resource "aws_cognito_user_pool_client" "tech_challenge_user_pool_client" {
  depends_on = [ aws_cognito_user_pool.tech_challenge_user_pool ]
  name = "tech_challenge_user_pool_client"
  user_pool_id = aws_cognito_user_pool.tech_challenge_user_pool.id
  generate_secret = false
  allowed_oauth_flows = ["code", "implicit",]
  explicit_auth_flows = ["ALLOW_CUSTOM_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]
  allowed_oauth_scopes = ["openid"]
  allowed_oauth_flows_user_pool_client = true
  callback_urls = ["http://localhost:3000"]
  logout_urls = ["http://localhost:3000"]
  supported_identity_providers = ["COGNITO"]
}

resource "aws_lambda_permission" "allow_cognito_to_invoke_pre_sign_up" {
  statement_id  = "AllowExecutionFromCognito"
  action        = "lambda:InvokeFunction"
  function_name = var.pre_sign_up
  principal     = "cognito-idp.amazonaws.com"
  source_arn    = aws_cognito_user_pool.tech_challenge_user_pool.arn
}

resource "aws_lambda_permission" "allow_cognito_to_invoke_create_auth_challenge" {
  statement_id  = "AllowExecutionFromCognito"
  action        = "lambda:InvokeFunction"
  function_name = var.create_auth_challenge
  principal     = "cognito-idp.amazonaws.com"
  source_arn    = aws_cognito_user_pool.tech_challenge_user_pool.arn
}

resource "aws_lambda_permission" "allow_cognito_to_invoke_define_auth_challenge" {
  statement_id  = "AllowExecutionFromCognito"
  action        = "lambda:InvokeFunction"
  function_name = var.define_auth_challenge
  principal     = "cognito-idp.amazonaws.com"
  source_arn    = aws_cognito_user_pool.tech_challenge_user_pool.arn
}

resource "aws_lambda_permission" "allow_cognito_to_invoke_verify_auth_challenge" {
  statement_id  = "AllowExecutionFromCognito"
  action        = "lambda:InvokeFunction"
  function_name = var.verify_auth_challenge
  principal     = "cognito-idp.amazonaws.com"
  source_arn    = aws_cognito_user_pool.tech_challenge_user_pool.arn
}
