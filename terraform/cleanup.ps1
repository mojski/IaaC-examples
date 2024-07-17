Remove-Item -Recurse -Force .\.terraform\
rm .\.terraform.lock.hcl
rm .\main.destroy.tfplan
rm .\terraform.tfstate
rm .\terraform.tfstate.backup
