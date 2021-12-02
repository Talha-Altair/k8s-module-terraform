variable "image" {

  type        = string
  description = "docker image URI"
  default     = "docker.io/nginx"

}

variable "name" {

  type        = string
  description = "Name to identify service and deployment after provisioning"
  default     = "altair"

}

variable "namespace" {

  type        = string
  description = "NameSPace in which resources shall be provisoned"
  default     = "altair-ns"

}

variable "port" {

  type        = string
  description = "docker container port"
  default     = "80"

}

variable "replicas" {

  type        = string
  description = "replicas of deployment pods"
  default     = 3

}
