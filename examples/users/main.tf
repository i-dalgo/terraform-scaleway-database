module "rdb" {
  source = "../../"

  databases = {
    main = {
      name      = "test-simple-db"
      node_type = "DB-DEV-S"
      engine    = "PostgreSQL-11"
      users = [
        {
          username        = "application"
          password_length = 16
          is_admin        = false
        },
        {
          username        = "administrator"
          password_length = 24
          is_admin        = true
        }
      ]
    }
    secondary = {
      name      = "test-simple-db"
      node_type = "DB-DEV-S"
      engine    = "PostgreSQL-11"
      users = [
        {
          password_length = 16
          is_admin        = false
          username        = "test1"
        }
      ]
    }
  }
}

output "rdb" {
  value     = module.rdb.this
  sensitive = true
}
