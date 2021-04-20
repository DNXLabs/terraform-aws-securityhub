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

variable "subscription_foundational" {
  type        = bool
  default     = false
  description = "Enables AWS Foundational Security Best Practices subscription"
}

variable "members" {
  type       = list
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