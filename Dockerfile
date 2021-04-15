FROM docker:19.03.0

RUN apk add --update make ca-certificates openssl python docker-compose && \
  wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz && \
  tar zxf google-cloud-sdk.tar.gz && ./google-cloud-sdk/install.sh --usage-reporting=false --path-update=true && \
  google-cloud-sdk/bin/gcloud --quiet components update && \
  ln -s /google-cloud-sdk/bin/gcloud /usr/local/bin/gcloud

RUN apk add --no-cache curl wget jq && \
  apk add --no-cache --virtual .run-deps ca-certificates
RUN wget -q https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl && \
  chmod +x /usr/local/bin/kubectl
