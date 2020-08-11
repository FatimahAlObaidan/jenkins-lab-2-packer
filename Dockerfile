from bryandollery/terraform-packer-aws-alpine
copy provision.sh /src/
copy packer.json /src/
copy creds/config /src/config/
entrypoint ["/bin/bash", "-c"]
