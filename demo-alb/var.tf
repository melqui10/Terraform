variable "availability_zones" {
  type        = list
  default = ["us-east-1a", "us-east-1b"]
}
variable "subnets_cidr" {
	type = list
	default = ["10.0.1.0/24", "10.0.2.0/24"]
}