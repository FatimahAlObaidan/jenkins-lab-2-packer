pipeline {

    agent {
        dockerfile {
      filename 'Dockerfile'
	     args "-u root --entrypoint=''"
        }
    }
    stages {
	stage ('build') {
		
		steps {
		sh "chmod +x provision.sh"
		sh "chmod +x packer.json"
		sh " make"
		sh "make build"
                sh 'packer build packer.json'
            }
        }
        
stage ('release') {
            
            steps {
               	sh "whoiam"
                sh "docker login -u ${CREDS_USR} -p ${CREDS_PSW}"
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
