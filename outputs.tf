################################################################################
# Zone
################################################################################

output "id" {
  description = "Zone ID of Route53 zone"
  value       = module.route53.id
}

output "arn" {
  description = "Zone ARN of Route53 zone"
  value       = module.route53.arn
}

output "name_servers" {
  description = "Name servers of Route53 zone"
  value       = module.route53.name_servers
}

output "primary_name_server" {
  description = "The Route 53 name server that created the SOA record."
  value       = module.route53.primary_name_server
}

output "name" {
  description = "Name of Route53 zone"
  value       = module.route53.name
}

################################################################################
# DNSSEC
################################################################################

output "dnssec_signing_key_digest_value" {
  description = "A cryptographic digest of a DNSKEY resource record (RR). DNSKEY records are used to publish the public key that resolvers can use to verify DNSSEC signatures that are used to secure certain kinds of information provided by the DNS system"
  value       = module.route53.dnssec_signing_key_digest_value
}

output "dnssec_signing_key_dnskey_record" {
  description = "A string that represents a DNSKEY record"
  value       = module.route53.dnssec_signing_key_dnskey_record
}

output "dnssec_signing_key_ds_record" {
  description = "A string that represents a delegation signer (DS) record"
  value       = module.route53.dnssec_signing_key_ds_record
}

output "dnssec_signing_key_id" {
  description = "Route 53 Hosted Zone identifier and KMS Key identifier, separated by a comma (`,`)"
  value       = module.route53.dnssec_signing_key_id
}

output "dnssec_signing_key_tag" {
  description = "An integer used to identify the DNSSEC record for the domain name. The process used to calculate the value is described in RFC-4034 Appendix B"
  value       = module.route53.dnssec_signing_key_tag
}

output "dnssec_signing_key_public_key" {
  description = "The public key, represented as a Base64 encoding, as required by RFC-4034 Page 5"
  value       = module.route53.dnssec_signing_key_public_key
}

# KMS key
output "dnssec_kms_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = module.route53.dnssec_kms_key_arn
}

output "dnssec_kms_key_id" {
  description = "The globally unique identifier for the key"
  value       = module.route53.dnssec_kms_key_id
}

output "dnssec_kms_key_region" {
  description = "The region for the key"
  value       = module.route53.dnssec_kms_key_region
}

output "dnssec_kms_key_policy" {
  description = "The IAM resource policy set on the key"
  value       = module.route53.dnssec_kms_key_policy
}

################################################################################
# Records
################################################################################

output "records" {
  description = "Records created in the Route53 zone"
  value       = module.route53.records
}