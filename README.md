# terraform-aws-securityhub

[![Lint Status](https://github.com/DNXLabs/terraform-aws-securityhub/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-securityhub/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-securityhub)](https://github.com/DNXLabs/terraform-aws-securityhub/blob/master/LICENSE)

This module sets up Security Hub in an account with option to send findings to slack and/or email.

The following resources will be created:
 
 - SecurityHub
 - Lambda function to send slack notifications (created using cloudformation, based on https://github.com/aws-samples/aws-securityhub-to-slack).
 - EventBridge Rules

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_ids | List of accounts to allow publishing to SNS | `list(string)` | `[]` | no |
| slack\_endpoint | endpoint to Slack notifications chanel | `string` | `""` | no |
| topic\_name | Topic name | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| aws\_sns\_topic\_arn | n/a |

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-sns/blob/master/LICENSE) for full details.
