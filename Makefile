dev:
	@git pull
	@rm -rf .terraform
	@terraform init  -backend-config=state.tf
	@terraform apply -auto-approve