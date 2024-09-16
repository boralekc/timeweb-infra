module "droplet" {
  source        = "./modules/droplet"
  vpc_name      = "k3s-vpc"
  vpc_region    = "fra1"
  droplet_name  = "k3s-droplet"
  droplet_image = "ubuntu-20-04-x64"
  droplet_size  = "s-2vcpu-4gb"
  token         = var.TOKEN
}

# module "database" {
#   source              = "./modules/postgres"
#   cluster_name        = "postgres-cluster"
#   type_cluster        = "pg"
#   version_cluster     = "16"
#   size_cluster        = "db-s-1vcpu-1gb"
#   region              = "fra1"
#   name_db_deutschhub  = var.DB_DEUTSCHHUB
#   name_db_deutschlern = var.DB_DEUTSCHLERN
#   token         = var.TOKEN
# }

# module "spaces" {
#   source           = "./modules/spaces"
#   space_dutschhub  = "s3-deutschhub"
#   space_dutschlern = "s3-deutschlern"
#   region           = "fra1"
#   token            = var.TOKEN
#   access_key       = var.SPACE_ACCESS_KEY
#   secret_key       = var.SPACE_SECRET_KEY
# }