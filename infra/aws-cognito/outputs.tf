output "tech_challenge_user_pool_id" {
  value = aws_cognito_user_pool.tech_challenge_user_pool.id
}

output "tech_challenge_user_pool_client_id" {
  value = aws_cognito_user_pool_client.tech_challenge_user_pool_client.id
}
