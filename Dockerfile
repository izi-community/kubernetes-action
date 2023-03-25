FROM alpine:3.11

ARG KUBECTL_VERSION="1.15.10"

RUN apk add py-pip curl
RUN pip install awscli
RUN curl -L -o /usr/bin/kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.24.10/2023-01-30/bin/linux/amd64/kubectl
RUN chmod +x /usr/bin/kubectl

RUN curl -o /usr/bin/aws-iam-authenticator https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.5.9/aws-iam-authenticator_0.5.9_linux_amd64
RUN chmod +x /usr/bin/aws-iam-authenticator

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
