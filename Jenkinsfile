pipeline {
  agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    some-label: some-label-value
spec:
  containers:
  - name: packer
    image: hashicorp/packer 
    command: 
    - bash
    tty: true
"""
    }
  }
  environment {
   CREDS = credentials('creds-fatima')
	    	AWS_ACCESS_KEY_ID = "$CREDS_USR"
        AWS_SECRET_ACCESS_KEY = "$CREDS_PSW"
	    	OWNER='fatima'
	    	TF_NAMESPACE='fatima'
	   	 PROJECT_NAME='packerweb-server'
  }
  stages {
      stage("build") {
          steps {
              container('packer') {
                  sh 'packer build packer.json'
              }
          }
      }
  }
  post {
    success {
        build quietPeriod: 0, wait: false, job: 'bryan-jenkins-lab-2-tf'  
    }
  }
}
