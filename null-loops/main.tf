/* Alta3 Research - rzfeeser@alta3.com
Working with "for_each" within a null_resource */

/* Terraform block */
terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

/* provider block */
provider "null" {
  # Configuration options
}

/* a list of local variables */
locals {
  avengers = {"ironman"= "hero"
              "captain america"= "hero"
              "thanos"= "villain"
              "venom"= "anti-hero"
             }
}


/* The null_resource implements the standard resource lifecycle but takes no more action */
resource "null_resource" "avengers" {
  for_each = local.avengers     // local is not a typo, locals.avengers would be incorrect
  triggers = {
    name = each.key 
    status= each.value
  }
}

/* We want these outputs */
output "avengers" {
  value = null_resource.avengers
}

