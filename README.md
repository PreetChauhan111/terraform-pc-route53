# terraform-pc-route53

Terraform wrapper module for [terraform-aws-modules/route53/aws](https://registry.terraform.io/modules/terraform-aws-modules/route53/aws/latest) `v6.4.0`.

## Usage

```hcl
module "route53" {
  source  = "./terraform-pc-route53"

  name         = "example.com"
  comment      = "Managed by Terraform"
  force_destroy = true

  records = {
    www = {
      type    = "A"
      ttl     = 300
      records = ["1.2.3.4"]
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.7 |
| aws | >= 6.28 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 6.28 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| create | Whether to create Route53 zone | `bool` | `true` | no |
| create_zone | Determines whether to create the Route53 zone or lookup an existing zone | `bool` | `true` | no |
| name | This is the name of the hosted zone | `string` | `""` | no |
| comment | A comment for the hosted zone. Defaults to `Managed by Terraform` | `string` | `null` | no |
| private_zone | Whether the hosted zone is private. Only applicable when `create_zone = false` | `bool` | `false` | no |
| vpc_id | The ID of the VPC associated with the existing hosted zone. Only applicable when `create_zone = false` | `string` | `null` | no |
| vpc | Configuration block(s) specifying VPC(s) to associate with a private hosted zone | `map(object)` | `null` | no |
| ignore_vpc | Determines whether to ignore VPC association changes after creation | `bool` | `false` | no |
| delegation_set_id | The ID of the reusable delegation set whose NS records you want to assign to the hosted zone | `string` | `null` | no |
| force_destroy | Whether to destroy all records in the zone when destroying the zone | `bool` | `null` | no |
| enable_accelerated_recovery | Whether to enable Route 53 Accelerated Recovery for the public hosted zone | `bool` | `null` | no |
| timeouts | Timeouts for the Route53 zone operations | `object` | `null` | no |
| vpc_association_authorizations | A map of VPC association authorizations to create for the Route53 zone | `map(object)` | `null` | no |
| enable_dnssec | Whether to enable DNSSEC for the Route53 zone | `bool` | `false` | no |
| create_dnssec_kms_key | Whether to create a KMS key for DNSSEC signing | `bool` | `true` | no |
| dnssec_kms_key_arn | The ARN of the KMS key to use for DNSSEC signing. Required when `create_dnssec_kms_key` is `false` | `string` | `null` | no |
| dnssec_kms_key_description | The description of the key as viewed in AWS console | `string` | `"Route53 DNSSEC KMS Key"` | no |
| dnssec_kms_key_aliases | A list of aliases to create for the DNSSEC KMS key | `list(string)` | `[]` | no |
| dnssec_kms_key_tags | Additional tags to apply to the KMS key created for DNSSEC signing | `map(string)` | `{}` | no |
| records | A map of Route53 records to create in the zone | `map(object)` | `{}` | no |
| tags | Tags added to all zones | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | Zone ID of Route53 zone |
| arn | Zone ARN of Route53 zone |
| name | Name of Route53 zone |
| name_servers | Name servers of Route53 zone |
| primary_name_server | The Route 53 name server that created the SOA record |
| records | Records created in the Route53 zone |
| dnssec_signing_key_digest_value | A cryptographic digest of a DNSKEY resource record |
| dnssec_signing_key_dnskey_record | A string that represents a DNSKEY record |
| dnssec_signing_key_ds_record | A string that represents a delegation signer (DS) record |
| dnssec_signing_key_id | Route 53 Hosted Zone identifier and KMS Key identifier |
| dnssec_signing_key_tag | An integer used to identify the DNSSEC record |
| dnssec_signing_key_public_key | The public key as a Base64 encoding |
| dnssec_kms_key_arn | The ARN of the DNSSEC KMS key |
| dnssec_kms_key_id | The globally unique identifier for the DNSSEC KMS key |
| dnssec_kms_key_region | The region for the DNSSEC KMS key |
| dnssec_kms_key_policy | The IAM resource policy set on the DNSSEC KMS key |
