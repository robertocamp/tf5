# RDS 

- Terraform allows you to structure your code through modules. In our case the rds module contains the description of the privionned MariaDB RDS managed database.
- In fact this RDS module is generic and could be used to create also PostgreSQL RDS instance. 
- It generates a MariaDB database because of the parameter define in the main.tf calling this module.

## LINKS

