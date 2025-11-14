/* variable "component" {
    default = catalogue
  
}

variable "rule_priority" {
    default = 10
  
} */

variable "components" {
    default = {
        catalogue = {
            rule_priority = 10
        }

        user = {
            rule_priority = 20
        }
    }
  
}