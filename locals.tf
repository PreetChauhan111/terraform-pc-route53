locals {
  common_tags = {
    Environment = var.environment
    Owner       = "pc"
    GitHubRepo  = "terraform-pc-route53"
  }
  common_name         = "${local.common_tags["Owner"]}-${var.environment}-${var.region}-route53"
  name                = var.name == "" ? local.common_name : var.name
  dnssec_ksm_key_tags = merge(local.common_tags, { KeyType = "KSK" })
  tags                = merge(local.common_tags, var.tags, { Name = local.name })
}