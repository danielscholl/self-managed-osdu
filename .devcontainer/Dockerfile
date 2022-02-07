# [Choice] Debian / Ubuntu version (use Debian 11/9, Ubuntu 18.04/21.04 on local arm64/Apple Silicon): debian-11, debian-10, debian-9, ubuntu-21.04, ubuntu-20.04, ubuntu-18.04
ARG VARIANT=debian-11
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}
WORKDIR /src

COPY library-scripts/*.sh /src/library-scripts/

# Install Terraform, tflint, Terragrunt
ARG TERRAFORM_VERSION=0.14.11
ARG TFLINT_VERSION=0.26.0
ARG TERRAGRUNT_VERSION=0.28.24
RUN bash /src/library-scripts/terraform-debian.sh "${TERRAFORM_VERSION}" "${TFLINT_VERSION}" "${TERRAGRUNT_VERSION}"

# Install Infra Azure Provisioning
ARG OSDU_VERSION=v0.12.0
RUN bash /src/library-scripts/osdu-infra.sh "${OSDU_VERSION}"

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends direnv
