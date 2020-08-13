from bryandollery/terraform-packer-aws-alpine
copy . /src/
copy creds/config /src/config/


from nginx
copy /home/ubuntu/index.html /usr/share/nginx/html 
entrypoint ["/bin/bash", "-c"]
