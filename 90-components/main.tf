module "components"{
    for_each = var.components
    source = "git::https://github.com/lavanya-esw/terraform_roboshop_component.git?ref=main"
    component = var.key
    rule_priority = var.value.rule_priority
}