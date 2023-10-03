resource "aws_ssm_parameter" "parameters" {
  count = length(var.parameters)
  name  = var.parameters[count.index].name
  type  = var.parameters[count.index].value
  value = var.parameters[count.index].type
}

variable "parameters" {
  default = [
    { name = "roboshop.{{env}}.frontend.catalogue_url" , value = "proxy_pass http://catalogue-{{env}}.devopskumar.site:8080/" , type = "String" } ,
    { name = "roboshop.{{env}}.frontend.cart_url" , value = "proxy_pass http://cart-{{env}}.devopskumar.site:8080/" , type = "String" } ,
    { name = "roboshop.{{env}}.frontend.user_url" , value = "proxy_pass http://user-{{env}}.devopskumar.site:8080/" , type = "String" } ,
    { name = "roboshop.{{env}}.frontend.payment_url" , value = "proxy_pass http://payment-{{env}}.devopskumar.site:8080/" , type = "String" } ,
    { name = "roboshop.{{env}}.frontend.shipping_url" , value = "proxy_pass http://shipping-{{env}}.devopskumar.site:8080/" , type = "String" } ,
    { name = "roboshop.{{env}}.catalogue.catalogue_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.{{env}}.catalogue.mongodb_env" , value = "true" , type = "String" } ,
    { name = "roboshop.{{env}}.catalogue.mongodb_url" , value = "mongodb://mongodb-{{env}}.devopskumar.site:27017/catalogue" , type = "String" } ,
    { name = "roboshop.{{env}}.cart.cart_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.{{env}}.cart.redis_host" , value = "redis-{{env}}.devopskumar.site" , type = "String" } ,
    { name = "roboshop.{{env}}.cart.catalogue_host" , value = "catalogue-{{env}}.devopskumar.site" , type = "String" } ,
    { name = "roboshop.{{env}}.cart.catalogue_port" , value = "8080" , type = "String" } ,
    { name = "roboshop.{{env}}.dispatch.dispatch_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.{{env}}.dispatch.rabbitmq_host" , value = "rabbitmq-{{env}}.devopskumar.site" , type = "String" } ,
    { name = "roboshop.{{env}}.dispatch.rabbitmq_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.{{env}}.payment.payment_user" , value = "root" , type = "String" } ,
    { name = "roboshop.{{env}}.payment.cart_host" , value = "cart-{{env}}.devopskumar.site" , type = "String" } ,
    { name = "roboshop.{{env}}.payment.cart_port" , value = "8080" , type = "String" } ,
    { name = "roboshop.{{env}}.payment.user_host" , value = "user-{{env}}.devopskumar.site" , type = "String" } ,
    { name = "roboshop.{{env}}.payment.user_port" , value = "8080" , type = "String" } ,
    { name = "roboshop.{{env}}.payment.rabbitmq_host" , value = "rabbitmq-{{env}}.devopskumar.site" , type = "String" } ,
    { name = "roboshop.{{env}}.payment.rabbitmq_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.{{env}}.shipping.shipping_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.{{env}}.shipping.cart_endpoint" , value = "cart-{{env}}.devopskumar.site:8080" , type = "String" } ,
    { name = "roboshop.{{env}}.shipping.mysql_db_host" , value = "mysql-{{env}}.devopskumar.site" , type = "String" } ,
    { name = "roboshop.{{env}}.user.user_user" , value = "roboshop" , type = "String" } ,
    { name = "roboshop.{{env}}.user.mongodb_env" , value = "true" , type = "String" } ,
    { name = "roboshop.{{env}}.user.redis_host" , value = "redis-{{env}}.devopskumar.site" , type = "String" } ,
    { name = "roboshop.{{env}}.user.mongodb_url" , value = "mongodb://mongodb-{{env}}.devopskumar.site:27017/users" , type = "String" } ,


    ##### Secure Strings
    { name = "roboshop.{{env}}.dispatch.rabbitmq_password" , value = "roboshop123" , type = "SecureString" } ,
    { name = "roboshop.{{env}}.payment.rabbitmq_password" , value = "roboshop123" , type = "SecureString" } ,

  ]
}

variable "env" {}