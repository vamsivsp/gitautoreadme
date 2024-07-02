bash
#!/bin/bash

# # Extract resource information from Terraform code
# resource_info=$(terraform-docs --format=json)

# # Generate README content using handlebars
# readme_content=$(handlebars -t README.tpl {{resource_info}})

# # Output the generated README content to a file
# echo "$readme_content" > README.md
# Parse Terraform configuration file

terraform_resources=$(terraform show -json)

# Extract resource information
resources=($(echo "$terraform_resources" | jq -r '.resource[] | .name'))

# Generate README content
for resource in "${resources[@]}"; do
  echo "## $resource"
  echo ""
  terraform show -json "$resource" | jq -r '.attributes[] | .name + ": " + .value'
  echo ""
done
