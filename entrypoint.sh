#!/bin/bash
set -e -u -o pipefail

echo "Deploying..."
az login --service-principal -t "$AZURE_SERVICE_TENANT" -u "$AZURE_SERVICE_APP_ID" -p "$AZURE_SERVICE_APP_PASSWORD"
az account set -s "$AZURE_SUBSCRIPTION"
RESOURCE_GROUP_NAME=$(az resource list -n "${AZURE_WEB_APP_NAME}" --resource-type "Microsoft.Web/Sites" --query '[0].resourceGroup' | xargs)
az webapp config container set -g "${RESOURCE_GROUP_NAME}" -n "${AZURE_WEB_APP_NAME}" -c "${CONTAINER_IMAGE_NAME}" -r "${REGISTRY_SERVER_URL}" -u "${REGISTRY_USERNAME}" -p "${REGISTRY_PASSWORD}"
az webapp restart -g "${RESOURCE_GROUP_NAME}" -n "${AZURE_WEB_APP_NAME}"
