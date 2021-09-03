provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAWZTYRQA7GBXUM2O2"
  secret_key = "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"
}
resource "aws_iam_role" "cae_assume_role" {
  name = "cae-assume-role"
  max_session_duration = 43200
  path = "/"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "sts:AssumeRole",
      "Condition" : {
         "StringEquals" : {
         "aws:PrincipalOrgID" : [ "o-mue86vvim7", "o-dzbtadms5g", "o-ipbw5mbclx", "o-qacvcrb8mc" ]
         },
         "StringLike" : {
         "aws:PrincipalArn": [
               "arn:aws:iam::*:role/*_mgmt_*",
               "arn:aws:iam::*:role/service-cae-api-entrypoint",
               "arn:aws:iam::*:role/cae_api_assume_role",
               "arn:aws:iam::*:role/cae-assume-role",
               "arn:aws:iam::*:role/banner-assume-role",
               "arn:aws:iam::*:role/JenkinsHost",
               "arn:aws:iam::*:role/cloudadmin",
               "arn:aws:iam::*:role/classiccloudsystemops"
         ]
         }
      }
    }
  ]
}
EOF
}

resource "aws_iam_policy" "cae_assume_role_policy" {
  name = "cae_assume_role_policy"
  lifecycle {
    ignore_changes = [description]
  }
  policy = <<EOF
{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Sid":"Stmt1473192706000",
         "Effect":"Allow",
         "Action":[
            "iam:AddRoleToInstanceProfile",
            "iam:CreateInstanceProfile",
            "iam:DeleteInstanceProfile",
            "iam:DeleteRolePolicy",
            "iam:GetInstanceProfile",
            "iam:ListInstanceProfiles",
            "iam:RemoveRoleFromInstanceProfile"
         ],
         "Resource":[
            "arn:aws:iam::467330498622:instance-profile/*"
         ]
      },
      {
         "Sid":"Stmt1473192850000",
         "Effect":"Allow",
         "Action":[
            "iam:AttachRolePolicy",
            "iam:CreateRole",
            "iam:DeleteRole",
            "iam:DeleteRolePolicy",
            "iam:DetachRolePolicy",
            "iam:GetRole",
            "iam:GetRolePolicy",
            "iam:ListInstanceProfilesForRole",
            "iam:ListRoles",
            "iam:PassRole",
            "iam:PutRolePolicy",
            "iam:TagRole",
            "iam:UntagRole",
            "iam:UpdateRole",
            "iam:TagPolicy"
         ],
         "Resource":[
            "arn:aws:iam::467330498622:role/*"
         ]
      },
      {
         "Sid":"Stmt1473193210000",
         "Effect":"Allow",
         "Action":[
            "events:DeleteRule",
            "events:DescribeRule",
            "events:DisableRule",
            "events:EnableRule",
            "events:ListRuleNamesByTarget",
            "events:ListRules",
            "events:ListTargetsByRule",
            "events:PutEvents",
            "events:PutRule",
            "events:PutTargets",
            "events:RemoveTargets",
            "events:TestEventPattern",
            "events:ListTagsForResource",
            "lambda:AddPermission",
            "lambda:ListFunctions",
            "lambda:RemovePermission"
         ],
         "Resource":[
            "*"
         ]
      },
      {
         "Sid":"Stmt1473193235000",
         "Effect":"Allow",
         "Action":[
            "ec2:*",
            "route53:*",
            "elasticloadbalancing:*",
            "autoscaling:*",
            "application-autoscaling:*",
            "rds:*",
            "lambda:*",
            "dynamodb:*",
            "sns:*",
            "sqs:*",
            "elasticfilesystem:*",
            "logs:*",
            "cloudwatch:*",
            "ecr:*",
            "ecs:*",
            "kms:*",
            "iam:CreateServiceLinkedRole",
            "acm:*",
            "iam:DeleteRole",
            "iam:CreateUser",
            "iam:DeleteUser",
            "iam:*AccessKey*",
            "iam:Get*",
            "iam:List*",
            "iam:PassRole",
            "iam:SimulateCustomPolicy",
            "iam:SimulatePrincipalPolicy",
            "iam:GetPolicy",
            "iam:DetachRolePolicy",
            "iam:CreateRole",
            "iam:CreatePolicyVersion",
            "iam:SetDefaultPolicyVersion",
            "iam:GetPolicyVersion",
            "iam:GetRolePolicy",
            "iam:PutUserPolicy",
            "iam:CreatePolicy",
            "iam:AttachRolePolicy",
            "iam:UpdateRoleDescription",
            "iam:UpdateAssumeRolePolicy",
            "iam:TagPolicy",
            "iam:TagUser",
            "ssm:*",
            "support:*",
            "s3:*",
            "cloudfront:*",
            "ds:*",
            "route53resolver:*",
            "ram:CreateResourceShare",
            "ram:AssociateResourceShare",
            "ram:AcceptResourceShareInvitation",
            "ram:ListResources",
            "ram:GetResourceShares",
            "ram:GetResourceShareInvitations",
            "ram:TagResource",
            "backup:*",
            "backup-storage:MountCapsule",
            "states:*",
            "cloudformation:*",
            "athena:*",
            "glue:*",
            "config:PutConfigRule",
            "kinesis:*",
            "firehose:*"
         ],
         "Resource":[
            "*"
         ]
      },
      {
         "Effect":"Allow",
         "Action":"secretsmanager:*",
         "Resource":[
            "*"
         ]
      },
      {
         "Effect":"Allow",
         "Sid":"EnableAccessToApiGateway",
         "Action":[
            "apigateway:*",
            "execute-api:*"
         ],
         "Resource":[
            "*"
         ]
      },
      {
         "Sid":"Stmt1473193391000",
         "Effect":"Allow",
         "Action":[
            "sts:AssumeRole",
            "iam:List*",
            "iam:ListRolePolicies",
            "iam:PassRole",
            "iam:CreateRole",
            "iam:CreatePolicy",
            "iam:DeletePolicy",
            "iam:DeletePolicyVersion",
            "iam:GetPolicy*",
            "iam:GetRole",
            "iam:AttachRolePolicy",
            "cloudwatchlog:DescribeLogGroups",
            "cloudwatchlog:DescribeLogStreams",
            "cloudwatchlog:GetLogEvents",
            "cloudwatch:GetMetricStatistics"
         ],
         "Resource":[
            "*"
         ]
      },
      {
         "Sid":"DontPurchaseRIs",
         "Effect":"Deny",
         "Action":[
            "ec2:PurchaseReservedInstancesOffering",
            "ec2:ModifyReservedInstances",
            "ec2:CancelReservedInstancesListing",
            "ec2:CreateReservedInstancesListing"
         ],
         "Resource":"*"
      },
      {
         "Sid":"DontTouchPredefinedRoles",
         "Effect":"Deny",
         "Action":[
            "iam:Add*",
            "iam:Attach*",
            "iam:Create*",
            "iam:Delete*",
            "iam:Detach*",
            "iam:Remove*",
            "iam:Put*",
            "iam:Reset*",
            "iam:Update*",
            "iam:Upload*",
            "iam:Tag*",
            "iam:Untag*"
         ],
         "Resource":[
            "arn:aws:iam::*:role/cloudmanagement",
            "arn:aws:iam::*:role/cloudreadonly",
            "arn:aws:iam::*:role/cloudsecurityadmin",
            "arn:aws:iam::*:role/cloudnetworkops",
            "arn:aws:iam::*:role/classiccloudossupport",
            "arn:aws:iam::*:role/classiccloudreadonly",
            "arn:aws:iam::*:role/classiccloudservices",
            "arn:aws:iam::*:role/classiccloudsystemops",
            "arn:aws:iam::*:role/pipelineadmin",
            "arn:aws:iam::*:role/moderncloudreadonly",
            "arn:aws:iam::*:user/okta"
         ]
      }
   ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "cae_assume_role_policy_attach" {
    role      = aws_iam_role.cae_assume_role.name
    policy_arn = aws_iam_policy.cae_assume_role_policy.arn
}

resource "aws_iam_role_policy_attachment" "cae_assume_role_aws_sm_attach" {
    role      = aws_iam_role.cae_assume_role.name
    policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [aws_iam_policy.cae_assume_role_policy]

  create_duration = "30s"
}

# This resource will create (at least) 30 seconds after aws_iam_policy.cae_assume_role_policy
resource "null_resource" "next" {
  depends_on = [time_sleep.wait_30_seconds]
}
