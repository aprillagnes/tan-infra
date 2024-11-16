variable "project_id" {
  type    = string
  default = "agnes-learning-project-2"
}
variable "region" {
  type    = string
  default = "asia-southeast2"
}

variable "app" {
  type    = string
  default = "tan"
}

variable "env" {
  type    = string
  default = "prod"
}

variable "ip_cidr_range" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "jenkins_instance" {
  type = object({
    name         = string
    machine_type = string
    description  = string
    network_tags = list(string)
    ports        = list(string)
  })

  default = {
    name         = "jenkins-sonar"
    machine_type = "n2-standard-2"
    description  = "instance for jenkins and sonar"
    network_tags = ["sonarqube", "jenkins"]
    ports        = ["8080", "9000", "22"]
  }
}
