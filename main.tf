module "aws-cognito" {
  source = "./infra/aws-cognito"
  create_auth_challenge = var.create_auth_challenge
  define_auth_challenge = var.define_auth_challenge
  pre_sign_up = var.pre_sign_up
  verify_auth_challenge = var.verify_auth_challenge
}
