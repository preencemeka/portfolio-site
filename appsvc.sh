# Create App svc plan
az appservice plan create \
  --name cicd-plan \
  --location westus2 \
  --resource-group cicd-rg \
  --is-linux

# Create webapp
az webapp create \
  --resource-group cicd-rg \
  --plan cicd-plan \
  --name cicd-preencewebapp \
  --deployment-container-image-name nginx

# config webapp
az webapp config container set \
  --name cicd-preencewebapp \
  --resource-group cicd-rg \
  --container-image-name preencemekaacr.azurecr.io/ci-cd-demo:v1 \
  --container-registry-url https://preencemekaacr.azurecr.io
