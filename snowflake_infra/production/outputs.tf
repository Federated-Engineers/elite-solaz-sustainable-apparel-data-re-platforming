output "dbt_cloud_user"{
    value = module.dbt_cloud_user.user_name
}

output "dbt_cloud_role"{
    value = snowflake_account_role.dbt_cloud.name
}
