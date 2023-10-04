resource "aws_ssm_parameter" "parameters" {
  count = length(var.parameters)
  name  = var.parameters[count.index].name
  type  = var.parameters[count.index].value
  value = var.parameters[count.index].type
}

variable "parameters" {
  default = [
    #### Parameters for Dev environment
    { name = "roboshop.dev.frontend.catalogue_url" , value = "proxy_pass http://catalogue-dev.devopskumar.site:8080/" , type = "String" } ,
    { name = "roboshop.dev.frontend.cart_url" , value = "proxy_pass http://cart-dev.devopskumar.site:8080/" , type = "String" } ,
    { name = "roboshop.dev.frontend.user_url" , value = "proxy_pass http://user-dev.devopskumar.site:8080/" , type = "String" } ,
    { name = "roboshop.dev.frontend.payment_url" , value = "proxy_pass http://payment-dev.devopskumar.site:8080/" , type = "String" } ,
    { name = "roboshop.dev.frontend.shipping_url" , value = "proxy_pass http://shipping-dev.devopskumar.site:8080/" , type = "String" } ,
    { name = "roboshop.dev.catalogue.catalogue_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.dev.catalogue.mongodb_env" , value = "true" , type = "String" } ,
    { name = "roboshop.dev.catalogue.mongodb_url" , value = "mongodb://mongodb-dev.devopskumar.site:27017/catalogue" , type = "String" } ,
    { name = "roboshop.dev.cart.cart_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.dev.cart.redis_host" , value = "redis-dev.devopskumar.site" , type = "String" } ,
    { name = "roboshop.dev.cart.catalogue_host" , value = "catalogue-dev.devopskumar.site" , type = "String" } ,
    { name = "roboshop.dev.cart.catalogue_port" , value = "8080" , type = "String" } ,
    { name = "roboshop.dev.dispatch.dispatch_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.dev.dispatch.rabbitmq_host" , value = "rabbitmq-dev.devopskumar.site" , type = "String" } ,
    { name = "roboshop.dev.dispatch.rabbitmq_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.dev.payment.payment_user" , value = "root" , type = "String" } ,
    { name = "roboshop.dev.payment.cart_host" , value = "cart-dev.devopskumar.site" , type = "String" } ,
    { name = "roboshop.dev.payment.cart_port" , value = "8080" , type = "String" } ,
    { name = "roboshop.dev.payment.user_host" , value = "user-dev.devopskumar.site" , type = "String" } ,
    { name = "roboshop.dev.payment.user_port" , value = "8080" , type = "String" } ,
    { name = "roboshop.dev.payment.rabbitmq_host" , value = "rabbitmq-dev.devopskumar.site" , type = "String" } ,
    { name = "roboshop.dev.payment.rabbitmq_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.dev.shipping.shipping_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.dev.shipping.cart_endpoint" , value = "cart-dev.devopskumar.site:8080" , type = "String" } ,
    { name = "roboshop.dev.shipping.mysql_db_host" , value = "mysql-dev.devopskumar.site" , type = "String" } ,
    { name = "roboshop.dev.user.user_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.dev.user.mongodb_env" , value = "true" , type = "String" } ,
    { name = "roboshop.dev.user.redis_host" , value = "redis-dev.devopskumar.site" , type = "String" } ,
    { name = "roboshop.dev.user.mongodb_url" , value = "mongodb://mongodb-dev.devopskumar.site:27017/users" , type = "String" } ,
    ##### Secure Strings
    { name = "roboshop.dev.dispatch.rabbitmq_password" , value = "roboshop123" , type = "SecureString" } ,
    { name = "roboshop.dev.payment.rabbitmq_password" , value = "roboshop123" , type = "SecureString" } ,


    #### Parameters for Prod environment
    { name = "roboshop.prod.frontend.catalogue_url" , value = "proxy_pass http://catalogue-prod.prodopskumar.site:8080/" , type = "String" } ,
    { name = "roboshop.prod.frontend.cart_url" , value = "proxy_pass http://cart-prod.prodopskumar.site:8080/" , type = "String" } ,
    { name = "roboshop.prod.frontend.user_url" , value = "proxy_pass http://user-prod.prodopskumar.site:8080/" , type = "String" } ,
    { name = "roboshop.prod.frontend.payment_url" , value = "proxy_pass http://payment-prod.prodopskumar.site:8080/" , type = "String" } ,
    { name = "roboshop.prod.frontend.shipping_url" , value = "proxy_pass http://shipping-prod.prodopskumar.site:8080/" , type = "String" } ,
    { name = "roboshop.prod.catalogue.catalogue_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.prod.catalogue.mongodb_env" , value = "true" , type = "String" } ,
    { name = "roboshop.prod.catalogue.mongodb_url" , value = "mongodb://mongodb-prod.prodopskumar.site:27017/catalogue" , type = "String" } ,
    { name = "roboshop.prod.cart.cart_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.prod.cart.redis_host" , value = "redis-prod.prodopskumar.site" , type = "String" } ,
    { name = "roboshop.prod.cart.catalogue_host" , value = "catalogue-prod.prodopskumar.site" , type = "String" } ,
    { name = "roboshop.prod.cart.catalogue_port" , value = "8080" , type = "String" } ,
    { name = "roboshop.prod.dispatch.dispatch_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.prod.dispatch.rabbitmq_host" , value = "rabbitmq-prod.prodopskumar.site" , type = "String" } ,
    { name = "roboshop.prod.dispatch.rabbitmq_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.prod.payment.payment_user" , value = "root" , type = "String" } ,
    { name = "roboshop.prod.payment.cart_host" , value = "cart-prod.prodopskumar.site" , type = "String" } ,
    { name = "roboshop.prod.payment.cart_port" , value = "8080" , type = "String" } ,
    { name = "roboshop.prod.payment.user_host" , value = "user-prod.prodopskumar.site" , type = "String" } ,
    { name = "roboshop.prod.payment.user_port" , value = "8080" , type = "String" } ,
    { name = "roboshop.prod.payment.rabbitmq_host" , value = "rabbitmq-prod.prodopskumar.site" , type = "String" } ,
    { name = "roboshop.prod.payment.rabbitmq_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.prod.shipping.shipping_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.prod.shipping.cart_endpoint" , value = "cart-prod.prodopskumar.site:8080" , type = "String" } ,
    { name = "roboshop.prod.shipping.mysql_db_host" , value = "mysql-prod.prodopskumar.site" , type = "String" } ,
    { name = "roboshop.prod.user.user_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.prod.user.mongodb_env" , value = "true" , type = "String" } ,
    { name = "roboshop.prod.user.redis_host" , value = "redis-prod.prodopskumar.site" , type = "String" } ,
    { name = "roboshop.prod.user.mongodb_url" , value = "mongodb://mongodb-prod.prodopskumar.site:27017/users" , type = "String" } ,
    ##### Secure Strings
    { name = "roboshop.prod.dispatch.rabbitmq_password" , value = "roboshop123" , type = "SecureString" } ,
    { name = "roboshop.prod.payment.rabbitmq_password" , value = "roboshop123" , type = "SecureString" } ,

  ]
}

