from bryandollery/terraform-packer-aws-alpine
copy creds/config /src/config/
entrypoint ["/bin/bash", "-c"]
