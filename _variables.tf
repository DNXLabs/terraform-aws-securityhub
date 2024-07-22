variable "subscription_pci" {
  type        = bool
  default     = false
  description = "Enables PCI-DSS Standards subscription"
}

variable "subscription_cis" {
  type        = bool
  default     = false
  description = "Enables CIS Foundations Benchmark Standards subscription"
}

variable "subscription_cis_version" {
  type        = string
  nullable    = false
  default     = "3.0.0"
  description = "The version of the CIS AWS Foundations Benchmark to subscribe to"
}

variable "subscription_foundational" {
  type        = bool
  default     = false
  description = "Enables AWS Foundational Security Best Practices subscription"
}

variable "subscription_resource_tagging" {
  type        = bool
  default     = false
  description = "Enables AWS Resource Tagging Standard subscription"
}

variable "subscription_nist" {
  type        = bool
  default     = false
  description = "Enables AWS NIST SP 800-53 subscription"
}

variable "severity_list" {
  type    = list(any)
  default = ["HIGH", "CRITICAL"]
}

variable "members" {
  type        = list(any)
  default     = []
  description = "List of member AWS accounts as [{account_id: '9999', email: 'a@b.com'}, {...}] }"
}

variable "invite" {
  type        = bool
  default     = true
  description = "Invite member accounts? (Use 'false' when this account is the delegated admin by master account)"
}

variable "alarm_email" {
  type        = string
  default     = ""
  description = "Enables email notification (optional)"
}
variable "alarm_slack_endpoint" {
  type        = string
  default     = ""
  description = "Enables slack notification to endpoint passed (optional)"
}

variable "chatbot_sns_topic" {
  type        = string
  default     = ""
  description = "SNS topic for chatbot notification"
}
