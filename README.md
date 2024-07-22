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
| terraform | >= 0.13.0 |
| random | >= 3.3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alarm\_email | Enables email notification (optional) | `string` | `""` | no |
| alarm\_slack\_endpoint | Enables slack notification to endpoint passed (optional) | `string` | `""` | no |
| chatbot\_sns\_topic | SNS topic for chatbot notification | `string` | `""` | no |
| invite | Invite member accounts? (Use 'false' when this account is the delegated admin by master account) | `bool` | `true` | no |
| members | List of member AWS accounts as [{account\_id: '9999', email: 'a@b.com'}, {...}] } | `list(any)` | `[]` | no |
| severity\_list | n/a | `list(any)` | <pre>[<br>  "HIGH",<br>  "CRITICAL"<br>]</pre> | no |
| subscription\_cis | Enables CIS Foundations Benchmark Standards subscription | `bool` | `false` | no |
| subscription\_cis\_version | The version of the CIS AWS Foundations Benchmark to subscribe to | `string` | `"3.0.0"` | no |
| subscription\_foundational | Enables AWS Foundational Security Best Practices subscription | `bool` | `false` | no |
| subscription\_nist | Enables AWS NIST SP 800-53 subscription | `bool` | `false` | no |
| subscription\_pci | Enables PCI-DSS Standards subscription | `bool` | `false` | no |
| subscription\_resource\_tagging | Enables AWS Resource Tagging Standard subscription | `bool` | `false` | no |

## Outputs

No output.

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-sns/blob/master/LICENSE) for full details.
