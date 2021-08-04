FROM argoproj/argocd:latest

ARG PLUGIN_VERSION=1.1.4

USER root

RUN apt-get update && \
    apt-get install -y \
        curl \
        awscli \
        gpg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -L -o argocd-vault-plugin https://github.com/IBM/argocd-vault-plugin/releases/download/v${PLUGIN_VERSION}/argocd-vault-plugin_${PLUGIN_VERSION}_linux_amd64 && \
    chmod +x argocd-vault-plugin && \
    mv argocd-vault-plugin /usr/local/bin

USER argocd