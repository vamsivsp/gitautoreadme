bash
#!/bin/bash

# Extract resource information from Terraform code
resource_info=$(terraform-docs --format=json)

# Generate README content using handlebars
readme_content=$(handlebars -t README.tpl {{resource_info}})

# Output the generated README content to a file
echo "$readme_content" > README.md
