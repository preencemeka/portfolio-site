#!/usr/bin/env bash

az group create --name cicd-rg --location eastus

az acr create --resource-group cicd-rg --name preencemekaacr --sku Basic
