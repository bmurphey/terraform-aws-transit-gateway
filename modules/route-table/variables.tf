variable "create" {
  description = "Controls if resources should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

################################################################################
# Route Table
################################################################################

variable "transit_gateway_id" {
  description = "The ID of the EC2 Transit Gateway for the route table"
  type        = string
}

variable "associations" {
  description = "List of Transit Gateway Attachments ids to associate to the route table"
  type = list(object({
    transit_gateway_attachment_id = string
    replace_existing_association  = optional(bool)
  }))
  default = []
}

variable "propagations" {
  description = "List of Transit Gateway Attachments ids to propagate to the route table"
  type        = list(string)
  default     = []
}

################################################################################
# Route(s)
################################################################################

variable "static_routes" {
  description = "A map of Transit Gateway routes to create in the route table"
  type = list(object({
    destination_cidr_block        = string
    blackhole                     = optional(bool, false)
    transit_gateway_attachment_id = optional(string)
  }))
  default = []
}

variable "vpc_routes" {
  description = "A map of VPC routes to create in the route table provided"
  type = map(object({
    route_table_id              = string
    destination_cidr_block      = optional(string)
    destination_ipv6_cidr_block = optional(string)
  }))
  default = {}
}
