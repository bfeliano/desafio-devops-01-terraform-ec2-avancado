output "instance_profile_name" {
  value = var.enable_iam ? aws_iam_instance_profile.profile[0].name : null
}