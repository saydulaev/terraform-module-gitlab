variable "tier" {
  type        = string
  description = "Define your Gitlab tier to activate premium and ultimate features"
  default     = "free"
  validation {
    condition     = contains(["free", "premium", "ultimate"], lower(var.tier))
    error_message = "The tier value must be one of `free`, `premium`, `ultimate`"
  }
}