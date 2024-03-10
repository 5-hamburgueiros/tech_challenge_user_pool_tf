resource "aws_cognito_user_pool" "tech_challenge_user_pool" {
  name = "tech_challenge_user_pool"
  username_attributes = ["username"]
  schema {
    name = "username"
    attribute_data_type = "String"
    required = true
  }
  lambda_config {
    create_auth_challenge = var.create_auth_challenge
    define_auth_challenge = var.define_auth_challenge
    pre_sign_up = var.pre_sign_up
    verify_auth_challenge_response = var.verify_auth_challenge_response
  }
  
}

# create a user pool client for login via CUSTOM AUTH FLOW

resource "aws_cognito_user_pool_client" "tech_challenge_user_pool_client" {
  name = "tech_challenge_user_pool_client"
  user_pool_id = aws_cognito_user_pool.tech_challenge_user_pool.id
  generate_secret = false
 
  allowed_oauth_flows = ["code", "implicit"]
  allowed_oauth_scopes = ["openid"]
  allowed_oauth_flows_user_pool_client = true
  callback_urls = ["http://localhost:3000"]
  logout_urls = ["http://localhost:3000"]
  supported_identity_providers = ["COGNITO"]
}
