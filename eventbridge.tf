resource "aws_cloudwatch_event_rule" "securityhub" {
  count       = var.alarm_email != "" || var.chatbot_sns_topic != "" ? 1 : 0
  name_prefix = "SecurityHubFindings"
  description = "Captures SecurityHub New Findings"

  event_pattern = <<EOF
{
  "detail-type": [
    "Security Hub Findings - Imported"
  ],
  "source": [
    "aws.securityhub"
  ],
  "detail": {
    "findings": {
      "Severity": {
        "Label": ${jsonencode(var.severity_list)}
      },
      "Workflow": {
        "Status": [
          "NEW"
        ]
      }
    }
  }
}
EOF
}


resource "aws_cloudwatch_event_target" "yada" {
  count      =  var.chatbot_sns_topic != "" ? 1 : 0

  target_id = "chatbot"
  rule      = aws_cloudwatch_event_rule.securityhub[0].name
  arn       = var.chatbot_sns_topic
}




