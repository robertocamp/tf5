#------------------------
# RDS INSTANCES
#------------------------
  #------------------------
  # MariaDB PRO 01
  #------------------------
  aws_rds_mariadb_pro_pub_01 = {
    identifier              = "ditwl-rds-mariadb-pro-pub-01"
    allocated_storage       = 20 #GB
    storage_type            = "gp2"
    final_snapshot_id       = "ditwl-rds-mariadb-pro-pub-01-final"
    skip_final_snapshot     = false
    engine                  = "mariadb"
    engine_version          = "10.2.11"
    instance_class          = "db.t2.micro"
    password                = "**************"
    username                = "ditwlRDSPROdb01" #Start with a letter. Only numbers, letters, and _ accepted, 1 to 16 characters long
    availability_zone       = "us-east-1a"
    backup_retention_period = 5
    #db_subnet_group_name   = See var aws_rds_sn_pro_01["name"]
    multi_az                = false
    vpc_security_group_ids  = ""
    parameter_group_name    = ""
    allow_major_version_up  = false
    publicly_accessible     = true
    tag_private_name        = "ditwl-rds-mariadb-pro-pub-01"
    tag_public_name         = "ditwl-rds-mariadb-pro-pub-01"
    tag_app                 = "mariadb"
    tag_app_id              = "mariadb-01"
    tag_os                  = "rds"
    tags_environment        = "pro"
    tag_cost_center         = "ditwl-permanent"
  }
  #------------------------
  # RDS Security Group
  #------------------------
  aws_sg_rds_mariadb_pro_pub_01 = {
    sec_name        = "ditwl-aws-sg-rds-mariadb-pro-pub-01"
    sec_description = "ditwl - MariaDb server access rules - Pub, Env: PRO"
    allow_all_outbound = false
  }
    #------------------------
    # Allow access from my Instances to DB port
    #------------------------
    aws_sr_rds_mariadb_pro_pub_01_instances_to_db_port = {
      type              = "ingress"
      from_port         = "3306"
      to_port           = "3306"
      protocol          = "tcp"
      #source_security_group_id module.aws_sec_group_ec2_default.id
      description       = "Access from Instances to DB port"
    }
