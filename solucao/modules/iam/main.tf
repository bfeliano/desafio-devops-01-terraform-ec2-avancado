resource "aws_iam_role" "role" {
  count = var.enable_iam ? 1 : 0

  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "rds_policy" {
  count = var.enable_iam ? 1 : 0

  name        = "${var.role_name}-rds-policy"
  description = "Policy com permissões de leitura no RDS"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "RDSReadOnly"
        Effect = "Allow"
        Action = [
          "rds:DescribeDBInstances",
          "rds:DescribeDBClusters",
          "rds:ListTagsForResource",
          "rds:DescribeDBParameterGroups",
          "rds:DescribeDBEngineVersions"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_rds_policy" {
  count = var.enable_iam ? 1 : 0

  role       = aws_iam_role.role[0].name
  policy_arn = aws_iam_policy.rds_policy[0].arn
}

resource "aws_iam_instance_profile" "profile" {
  count = var.enable_iam ? 1 : 0

  name = var.instance_profile_name
  role = aws_iam_role.role[0].name
}