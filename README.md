# ec2-keypair

A Terraform module to manage a SSH key as an EC2 key pair.

**IMPORTANT**: Currently the private part of the key is stored as plain text in
the Terraform state. Be careful.


## Usage example

```hcl
module "ecs_instances_key_pair" {
  source = "..."
  version = "..."
  name = "ecs-production"
}
```

The generated key name will be appended with its creation date.

```hcl
key_name = module.ecs_instances_key_pair.key_name  # ecs-production-2020-01-01
```
