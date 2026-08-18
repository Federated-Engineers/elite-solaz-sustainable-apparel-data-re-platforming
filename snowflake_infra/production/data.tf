data "aws_ssm_parameter" "ecs_user_password" {
  name = "/production/elite/snowflake/kings_county/ecs_user_password"
}
