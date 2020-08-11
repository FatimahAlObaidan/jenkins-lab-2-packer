pipeline {

    agent {
        docker {
      image "bryandollery/terraform-packer-aws-alpine"
      args "-u root --entrypoint='' --rm"
    }
    }
    stages {
	stage ('build') {
		
		steps {
		sh 'chmod +x provision.sh'
		sh 'chmod +x packer.json'
                sh 'packer build packer.json'
            }
        }
        

	    
   }
	environment{
             	CREDS = credentials('creds-fatima')
	    	AWS_ACCESS_KEY_ID = "$CREDS_USR"
            	AWS_SECRET_ACCESS_KEY = "$CREDS_PSW"
	    	OWNER='fatima'
	    	TF_NAMESPACE='fatima'
	   	 PROJECT_NAME='packerweb-server'
    }
	post {
    success {
        build quietPeriod: 0, wait: false, job: 'bryan-jenkins-lab-2-tf'  
    }
  }
}
