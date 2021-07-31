module "vpc" {
    source = "./modules/vpc"
}

module "rds" {
    source = "./modules/rds"
    db_sub_gr_name    = "mariadbrdssub_gr_name"
    sec_grp_rds       = "${module.sec_group_rds.sec_grp_rds}"
    identifier        = "mariadbrds"
    storage_type      = "${var.storage_type}"
    allocated_storage = "${var.allocated_storage}"
    db_engine         = "mariadb"
    engine_version    = "10.3"
    instance_class    = "${var.instance_class}"
    db_username       = "${var.db_username}"
    db_password       = "${var.db_password}"
}
