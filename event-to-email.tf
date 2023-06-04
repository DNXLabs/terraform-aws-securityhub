resource "aws_cloudwatch_event_target" "sns" {
  count     = var.alarm_email != "" ? 1 : 0
  rule      = aws_cloudwatch_event_rule.securityhub[0].name
  target_id = "securityhub-to-sns"
  arn       = aws_sns_topic.securityhub[0].arn
  input_transformer {
    input_template = "\"SecurityHub <aws_account_id>/<aws_region> <severity> <title> <remediation_url>\""
    input_paths = {
      "aws_account_id"  = "$.detail.findings[0].AwsAccountId"
      "aws_region"      = "$.region"
      "remediation_url" = "$.detail.findings[0].Remediation.Recommendation.Url"
      "severity"        = "$.detail.findings[0].Severity.Label"
      "title"           = "$.detail.findings[0].Title"
    }
  }
}

resource "aws_sns_topic" "securityhub" {
  count       = var.alarm_email != "" ? 1 : 0
  name_prefix = "securityhub-"
}

resource "aws_sns_topic_policy" "default" {
  count  = var.alarm_email != "" ? 1 : 0
  arn    = aws_sns_topic.securityhub[0].arn
  policy = data.aws_iam_policy_document.sns_topic_policy[0].json
}

data "aws_iam_policy_document" "sns_topic_policy" {
  count = var.alarm_email != "" ? 1 : 0
  statement {
    effect  = "Allow"
    actions = ["SNS:Publish"]
    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
    resources = [aws_sns_topic.securityhub[0].arn]
  }
}

resource "aws_sns_topic_subscription" "email" {
  count     = var.alarm_email != "" ? 1 : 0
  topic_arn = aws_sns_topic.securityhub[0].arn
  protocol  = "email"
  endpoint  = try(var.alarm_email, "")
}
