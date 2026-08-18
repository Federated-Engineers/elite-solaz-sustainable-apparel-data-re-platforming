data "aws_ssm_parameter" "engineer_user_password" {
  name = "/production/elite/snowflake/kings_county/engineer_user_password"
}

data "aws_ssm_parameter" "analyst_user_password" {
  name = "/production/elite/snowflake/kings_county/analyst_user_password"
}