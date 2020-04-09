FROM docker:19.03.0

RUN apk add --update make ca-certificates openssl python && \
  wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz && \
  tar zxf google-cloud-sdk.tar.gz && ./google-cloud-sdk/install.sh --usage-reporting=false --path-update=true && \
  google-cloud-sdk/bin/gcloud --quiet components update && \
  ln -s /google-cloud-sdk/bin/gcloud /usr/local/bin/gcloud
