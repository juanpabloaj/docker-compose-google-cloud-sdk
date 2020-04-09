# alpine-docker-google-cloud-sdk

Usage

Set environment variable with your credentials

    GCLOUD_SERVICE_KEY

Add to your pipeline

    echo $GCLOUD_SERVICE_KEY > ${HOME}/gcloud-service-key.json
    gcloud auth activate-service-account --key-file ${HOME}/gcloud-service-key.json
    docker login -u _json_key --password-stdin https://gcr.io < ${HOME}/gcloud-service-key.json
