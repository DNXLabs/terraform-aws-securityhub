
# resource "random_string" "to_slack_cf_suffix" {
#   count   = var.alarm_slack_endpoint != "" ? 1 : 0
#   length  = 8
#   special = false
#   lower   = true
#   numeric = false
# }

# resource "aws_cloudformation_stack" "to_slack" {
#   count         = var.alarm_slack_endpoint != "" ? 1 : 0
#   name          = "SecurityHubToSlack-${random_string.to_slack_cf_suffix[0].result}"
#   template_body = file("${path.module}/event-to-slack.cf.json")
#   parameters = {
#     IncomingWebHookURL  = var.alarm_slack_endpoint
#     SecurityHubEventArn = aws_cloudwatch_event_rule.securityhub[0].arn
#   }
#   capabilities = ["CAPABILITY_IAM"]
# }

# resource "aws_cloudwatch_event_target" "to_slack" {
#   count     = var.alarm_slack_endpoint != "" ? 1 : 0
#   rule      = aws_cloudwatch_event_rule.securityhub[0].name
#   target_id = "securityhub-to-slack"
#   arn       = aws_cloudformation_stack.to_slack[0].outputs.LambdaFindingsToSlackArn
# }
