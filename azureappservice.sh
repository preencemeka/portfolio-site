#!/usr/bin/env bash

# Create App Service Plan
#az appservice plan create \
 # --name cicd-plan \
  #--resource-group cicd-rg \
  #--is-linux

# Create Web App
#az webapp create \
 # --resource-group cicd-rg \
  #--plan cicd-plan \
  #--name cicd-preencemeka-webapp \
  #--deployment-container-image-name nginx



set -euo pipefail

# -------- Config --------
LOCATION="${LOCATION:-westus2}"
RESOURCE_GROUP="${RESOURCE_GROUP:-cicd-rg}"
PLAN_NAME="${PLAN_NAME:-cicd-plan}"
APP_NAME="${APP_NAME:-cicdwebapp}"
ACR_LOGIN_SERVER="${ACR_LOGIN_SERVER:-preencemekaacr.azurecr.io}"
IMAGE_NAME="${IMAGE_NAME:-ci-cd-demo:v1}"
#FULL_IMAGE="$ACR_LOGIN_SERVER/$IMAGE_NAME"

echo "Using region: $LOCATION"

# -------- Create RG --------
#az group create \
 # --name "$RESOURCE_GROUP" \
  #--location "$LOCATION"

# -------- Create App Service Plan --------
az appservice plan create \
  --name "$PLAN_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --is-linux \
  --sku B1

# -------- Create Web App from container image --------
az webapp create \
  --resource-group "$RESOURCE_GROUP" \
  --plan "$PLAN_NAME" \
  --name "$APP_NAME" \
  --deployment-container-image-name "$FULL_IMAGE"

# -------- App settings --------
az webapp config appsettings set \
  --resource-group "$RESOURCE_GROUP" \
  --name "$APP_NAME" \
  --settings WEBSITES_PORT=80

echo "Deployment created successfully."
echo "App URL: https://$APP_NAME.azurewebsites.net"
