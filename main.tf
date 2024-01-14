resource "aws_ssm_parameter" "params" {
  count = length(var.parameters)
  name  = var.parameters[count.index].name
  type  = var.parameters[count.index].type
  value = var.parameters[count.index].value

  overwrite = true
  key_id   = "a22c937a-e218-4e4a-b545-d6c384ff99fc"
}

variable "parameters" {
  default = [
    #### Parameters for Dev environment
    ##Frontend
    { name = "roboshop.dev.frontend.catalogue_url" , value = "https://catalogue-dev.devopskumar.site/" , type = "String" } ,
    { name = "roboshop.dev.frontend.cart_url" , value = "https://cart-dev.devopskumar.site/" , type = "String" } ,
    { name = "roboshop.dev.frontend.user_url" , value = "https://user-dev.devopskumar.site/" , type = "String" } ,
    { name = "roboshop.dev.frontend.payment_url" , value = "https://payment-dev.devopskumar.site/" , type = "String" } ,
    { name = "roboshop.dev.frontend.shipping_url" , value = "https://shipping-dev.devopskumar.site/" , type = "String" } ,
    ##Catalogue
    { name = "roboshop.dev.catalogue.catalogue_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.dev.catalogue.mongodb_env" , value = "true" , type = "String" } ,
    { name = "roboshop.dev.catalogue.mongo_url", value = "mongodb://roboshop:roboshop123@docdb-dev.cluster-cbvsbeoyxek4.us-east-1.docdb.amazonaws.com:27017/catalogue?tls=true&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false", type = "SecureString" },
    { name = "roboshop.dev.catalogue.docdb_endpoint", value = "docdb-dev.cluster-cbvsbeoyxek4.us-east-1.docdb.amazonaws.com", type = "String" },

    ##Cart
    { name = "roboshop.dev.cart.cart_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.dev.cart.redis_host" , value = "elasticache-dev.nud0cy.clustercfg.use1.cache.amazonaws.com" , type = "String" } ,
    { name = "roboshop.dev.cart.catalogue_host" , value = "catalogue-dev.devopskumar.site" , type = "String" } ,
    { name = "roboshop.dev.cart.catalogue_port" , value = "80" , type = "String" } ,
    ##Dispatch
    { name = "roboshop.dev.dispatch.dispatch_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.dev.dispatch.rabbitmq_host" , value = "rabbitmq-dev.devopskumar.site" , type = "String" } ,
    { name = "roboshop.dev.dispatch.rabbitmq_user" , value = "roboshop" , type = "String" } ,
    ##Payment
    { name = "roboshop.dev.payment.payment_user" , value = "root" , type = "String" } ,
    { name = "roboshop.dev.payment.cart_host" , value = "cart-dev.devopskumar.site" , type = "String" } ,
    { name = "roboshop.dev.payment.cart_port" , value = "80" , type = "String" } ,
    { name = "roboshop.dev.payment.user_host" , value = "user-dev.devopskumar.site" , type = "String" } ,
    { name = "roboshop.dev.payment.user_port" , value = "80" , type = "String" } ,
    { name = "roboshop.dev.payment.rabbitmq_host" , value = "rabbitmq-dev.devopskumar.site" , type = "String" } ,
    { name = "roboshop.dev.payment.rabbitmq_user" , value = "roboshop" , type = "String" } ,
    ###Shipping
    { name = "roboshop.dev.shipping.shipping_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.dev.shipping.cart_endpoint" , value = "cart-dev.devopskumar.site:80" , type = "String" } ,
    { name = "roboshop.dev.shipping.mysql_db_host" , value = "rds-dev.cluster-cbvsbeoyxek4.us-east-1.rds.amazonaws.com" , type = "String" } ,
    ##User
    { name = "roboshop.dev.user.user_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.dev.user.mongodb_env" , value = "true" , type = "String" } ,
    { name = "roboshop.dev.user.redis_host", value = "elasticache-dev.nud0cy.clustercfg.use1.cache.amazonaws.com", type = "String" },
    { name = "roboshop.dev.user.mongodb_url" , value = "mongodb://roboshop:roboshop123@docdb-dev.cluster-cbvsbeoyxek4.us-east-1.docdb.amazonaws.com:27017/catalogue?tls=true&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false", type = "SecureString" },
    { name = "roboshop.dev.user.docdb_endpoint", value = "docdb-dev.cluster-cbvsbeoyxek4.us-east-1.docdb.amazonaws.com", type = "String" },
    ##MYSQL
    { name = "roboshop.dev.mysql.username" , value = "roboshop" , type = "String"},
    { name = "roboshop.dev.mysql.endpoint", value = "rds-dev.cluster-cbvsbeoyxek4.us-east-1.rds.amazonaws.com", type = "String" },

    ##DOCDB
    { name = "roboshop.dev.docdb.username" , value = "roboshop" , type = "String"},
    ##RabbitMQ
    { name = "roboshop.dev.rabbitmq.amqp_user", value = "roboshop", type = "String" },




    ##### Secure "String"s
    { name = "roboshop.dev.dispatch.rabbitmq_password" , value = "roboshop123" , type = "SecureString" } ,
    { name = "roboshop.dev.payment.rabbitmq_password" , value = "roboshop123" , type = "SecureString" } ,
    { name = "roboshop.dev.mysql.password" , value = "roboshop123" , type = "SecureString" } ,
    { name = "roboshop.dev.docdb.password" , value = "roboshop123" , type = "SecureString" } ,
    { name = "roboshop.dev.rabbitmq.amqp_pass", value = "roboshop123", type = "SecureString" },



    #### Parameters for Prod environment
    { name = "roboshop.prod.frontend.catalogue_url" , value = "proxy_pass https://catalogue-prod.devopskumar.site/" , type = "String" } ,
    { name = "roboshop.prod.frontend.cart_url" , value = "proxy_pass https://cart-prod.devopskumar.site/" , type = "String" } ,
    { name = "roboshop.prod.frontend.user_url" , value = "proxy_pass https://user-prod.devopskumar.site/" , type = "String" } ,
    { name = "roboshop.prod.frontend.payment_url" , value = "proxy_pass https://payment-prod.devopskumar.site/" , type = "String" } ,
    { name = "roboshop.prod.frontend.shipping_url" , value = "proxy_pass https://shipping-prod.devopskumar.site/" , type = "String" } ,
    { name = "roboshop.prod.catalogue.catalogue_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.prod.catalogue.mongodb_env" , value = "true" , type = "String" } ,
    { name = "roboshop.prod.catalogue.mongodb_url" , value = "mongodb://mongodb-prod.devopskumar.site:27017/catalogue" , type = "String" } ,
    { name = "roboshop.prod.cart.cart_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.prod.cart.redis_host" , value = "redis-prod.devopskumar.site" , type = "String" } ,
    { name = "roboshop.prod.cart.catalogue_host" , value = "catalogue-prod.devopskumar.site" , type = "String" } ,
    { name = "roboshop.prod.cart.catalogue_port" , value = "8080" , type = "String" } ,
    { name = "roboshop.prod.dispatch.dispatch_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.prod.dispatch.rabbitmq_host" , value = "rabbitmq-prod.devopskumar.site" , type = "String" } ,
    { name = "roboshop.prod.dispatch.rabbitmq_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.prod.payment.payment_user" , value = "root" , type = "String" } ,
    { name = "roboshop.prod.payment.cart_host" , value = "cart-prod.devopskumar.site" , type = "String" } ,
    { name = "roboshop.prod.payment.cart_port" , value = "8080" , type = "String" } ,
    { name = "roboshop.prod.payment.user_host" , value = "user-prod.devopskumar.site" , type = "String" } ,
    { name = "roboshop.prod.payment.user_port" , value = "8080" , type = "String" } ,
    { name = "roboshop.prod.payment.rabbitmq_host" , value = "rabbitmq-prod.devopskumar.site" , type = "String" } ,
    { name = "roboshop.prod.payment.rabbitmq_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.prod.shipping.shipping_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.prod.shipping.cart_endpoint" , value = "cart-prod.devopskumar.site:8080" , type = "String" } ,
    { name = "roboshop.prod.shipping.mysql_db_host" , value = "mysql-prod.devopskumar.site" , type = "String" } ,
    { name = "roboshop.prod.user.user_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.prod.user.mongodb_env" , value = "true" , type = "String" } ,
    { name = "roboshop.prod.user.redis_host" , value = "redis-prod.devopskumar.site" , type = "String" } ,
    { name = "roboshop.prod.user.mongodb_url" , value = "mongodb://mongodb-prod.devopskumar.site:27017/users" , type = "String" } ,
    ##### Secure "String"s
    { name = "roboshop.prod.dispatch.rabbitmq_password" , value = "roboshop123" , type = "SecureString" } ,
    { name = "roboshop.prod.payment.rabbitmq_password" , value = "roboshop123" , type = "SecureString" } ,

  ]
}

