data "aws_route53_zone" "zone_id" {
  name = "awsdevops.fun" # Note the trailing dot for the FQDN
}