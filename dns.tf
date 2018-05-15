resource "aws_route53_record" "subdomain-www" {
  zone_id = "${var.zoneid}"
  name    = "www.${var.name}"
  type    = "A"
  count = "${var.subdomain}"

  alias {
    name                   = "${aws_cloudfront_distribution.s3_distribution.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.s3_distribution.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "subdomain-root" {
  zone_id = "${var.zoneid}"
  name    = "${var.name}"
  type    = "A"
  count = "${var.subdomain}"

  alias {
    name                   = "${aws_cloudfront_distribution.s3_distribution.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.s3_distribution.hosted_zone_id}"
    evaluate_target_health = false
  }
}


resource "aws_route53_record" "www" {
  zone_id = "${var.zoneid}"
  name    = "www"
  type    = "A"
  count = "${var.tldn}"

  alias {
    name                   = "${aws_cloudfront_distribution.s3_distribution.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.s3_distribution.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "root" {
  zone_id = "${var.zoneid}"
  type    = "A"
  count = "${var.tldn}"
  name = ""

  alias {
    name                   = "${aws_cloudfront_distribution.s3_distribution.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.s3_distribution.hosted_zone_id}"
    evaluate_target_health = false
  }
}
