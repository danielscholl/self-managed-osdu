#!/usr/bin/env bash
#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------
#
# Docs:https://community.opengroup.org/osdu/platform/deployment-and-operations/infra-azure-provisioning
# Maintainer: Microsoft OSDU on Azure Teams
#
# Syntax: ./osdu-infra.sh

OSDU_VERSION=${1:-"v0.11.2"}

set -e

# Install OSDU on Azure Terraform Templates
echo "Downloading infrastructure templates..."
mkdir -p /tmp/osdu-downloads
mkdir /osdu-azure
curl -sSL -o /tmp/osdu-downloads/osdu.tar.gz https://community.opengroup.org/osdu/platform/deployment-and-operations/infra-azure-provisioning/-/archive/${OSDU_VERSION}/infra-azure-provisioning-${OSDU_VERSION}.tar.gz
tar -xzvf /tmp/osdu-downloads/osdu.tar.gz -C /osdu-azure --strip-components=2 infra-azure-provisioning-${OSDU_VERSION}/infra/modules
tar -xzvf /tmp/osdu-downloads/osdu.tar.gz -C /osdu-azure --strip-components=2 infra-azure-provisioning-${OSDU_VERSION}/infra/templates
tar -xzvf /tmp/osdu-downloads/osdu.tar.gz -C /usr/local/bin --strip-components=3 infra-azure-provisioning-${OSDU_VERSION}/infra/scripts/terraform.sh
cp /usr/local/bin/terraform.sh /usr/local/bin/deploy && chmod 766 /usr/local/bin/deploy

# Insert Network-Existing into Terraform Modules 
curl -sSL -o /tmp/osdu-downloads/network-existing.tar.gz https://github.com/grtn316/self-managed-osdu/raw/networking/scripts/assets/network-existing.tar.gz
tar -xzvf /tmp/osdu-downloads/network-existing.tar.gz -C /osdu-azure/modules/providers/azure

# Replace TF file with modified version for Network-Existing
curl -sSL -o /tmp/osdu-downloads/main.tf https://raw.githubusercontent.com/grtn316/self-managed-osdu/networking/scripts/assets/tf/main.tf
cp /tmp/osdu-downloads/main.tf /osdu-azure/templates/osdu-r3-mvp/service_resources/main.tf

echo "Done!"