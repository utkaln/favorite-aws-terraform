# favorite-aws-terraform

Favorite AWS Terraform Scripts

## Getting Started

- provider.tf contains all the library dependencies, this one has AWS resources yet
- Put all the configurable values in `variables.tf`
- Put all the items that needs to be printed in `outputs.tf`
- Put all the individual components as modules inside the resource specific directories. Each
- Start with command `terrform init` everytime a new resource definition is introduced
- Ensure all dependencies are met by running `terraform validate`
- After writing script use plan to check if script is alright `terraform plan --out=plandata.txt`
- If everything alright run `terraform apply`
- Check the state of the deployments using `terraform show`
- For details of the state `terraform
- To clean up run `terraform destroy`

### Using Modules

- **Use Registry**: Refer to a registry of pre-defined modules [Example](https://github.com/hashicorp/learn-terraform-modules-use/blob/494bb079d32269d94a9d5894538197d6a5d2e7df/main.tf#L11)
- **Use local modules**: Create `main.tf`, `variables.tf` and `outputs.tf` under the `modules` directory
- Optimize objects: [Example Reference](https://developer.hashicorp.com/terraform/tutorials/modules/module-object-attributes)

### DynamoDB

- Refer to tf scripts under modules > ddb
- More info [Hashicorp Dynamo DB Example](https://github.com/hashicorp/learn-terraform-aws-dynamodb-scale)
