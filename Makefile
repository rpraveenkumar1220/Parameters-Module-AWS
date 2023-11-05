dev:
	@rm -rf .terraform
	@git pull
	@terraform init -backend-config = "state.tf"
	@terraform apply -auto-approve