resource "aws_cloudwatch_event_rule" "securityhub" {
  count       = var.alarm_email != "" || var.alarm_slack_endpoint != "" ? 1 : 0
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
        "Label": [
          "MEDIUM",
          "HIGH",
          "CRITICAL"
        ]
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

