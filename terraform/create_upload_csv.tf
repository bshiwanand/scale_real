provider "aws" {
	version = "~> 2.25"
	profile = var.aws_profile_name
	region  = var.region_name
}

resource "aws_security_group" "security_group" {
	name = "${var.tomcat_security_group_name}_${var.jenkins_build_number}"
	vpc_id = var.vpc_id
	description = "${var.tomcat_security_group_name} rule"

	dynamic "ingress" {
		for_each = var.ingress_security_group
		content {
			from_port = ingress.value.from_port
			to_port = ingress.value.to_port
			protocol = "tcp"
			cidr_blocks = ingress.value.cidr_blocks
		}
  	}

	dynamic "egress" {
		for_each = var.egress_security_group
		content	{
			from_port = egress.value.from_port
			to_port = egress.value.to_port
			protocol = egress.value.protocol
			cidr_blocks = egress.value.cidr_blocks
		}
	}
}

resource "aws_s3_bucket" "scale_real_test" {
  bucket = var.bucket_name
  acl = var.acl_var
  versioning {
    enabled = true
  }

  tags {
    Name = var.bucket_tag
  }

}

resource "aws_s3_bucket_object" "csv_files" {
for_each = fileset("${var.csv_file_path}/", "*.csv")
bucket = var.bucket_name
key = each.value
source = "${var.csv_file_path}/${each.value}"
etag = filemd5("myfiles/${each.value}")
}


