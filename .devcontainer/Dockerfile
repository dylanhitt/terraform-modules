FROM golang:1.18-buster AS golang
FROM alpine/terragrunt:1.1.4 AS terragrunt
FROM python:3.9.4-slim-buster

# Terraform & Terragrunt
COPY --from=terragrunt /bin/terraform /usr/bin/terraform
COPY --from=terragrunt /usr/local/bin/terragrunt /usr/bin/terragrunt

COPY --from=golang /usr/local/go /usr/local/go
ENV PATH="/usr/local/go/bin:${PATH}"

# Save all of the certs in a request as files in /tmp
# Allow man pages to be installed (especially for git help)
RUN sed -i 's,^path-exclude /usr/share/man/,#path-exclude /usr/share/man/,' /etc/dpkg/dpkg.cfg.d/docker && \
  # Install From Package Repositories
  apt-get update && \
  apt install -y --no-install-recommends \
  # Direct-use commands
  bash \
  bash-completion \
  git \
  jq \
  less \
  man \
  vim-tiny \
  # aws-adfs dependencies
  gcc \
  groff \
  make \
  libkrb5-dev && \
  rm -rf /var/lib/apt/lists/* && \
  useradd -ms /bin/bash vscode && \
  # AWS-ADFS
  python3 -m pip install -U pip setuptools wheel && \
  python3 -m pip install aws-adfs awscli

USER vscode
