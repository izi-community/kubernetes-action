FROM alpine:3.11

ARG KUBECTL_VERSION="1.15.10"

RUN apk add py-pip curl
RUN pip install awscli
RUN curl -L -o /usr/bin/kubectl curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.16/2023-01-30/bin/linux/amd64/kubectl
RUN chmod +x /usr/bin/kubectl

RUN curl -o /usr/bin/aws-iam-authenticator https://s3.us-west-2.amazonaws.com/amazon-eks/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x /usr/bin/aws-iam-authenticator

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
