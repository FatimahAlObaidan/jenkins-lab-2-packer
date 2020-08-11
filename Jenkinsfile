pipeline {

    agent {
        docker {
            image 'bryandollery/terraform-packer-aws-alpine'
	    args "-u root"
        }
    }
    stages {
	stage ('build') {
		environment{
             	CREDS = credentials('creds-fatima')
	    	AWS_ACCESS_KEY_ID = "$CREDS_USR"
            	AWS_SECRET_ACCESS_KEY = "$CREDS_PSW"
	    	OWNER='fatima'
	    	TF_NAMESPACE='fatima'
	   	 PROJECT_NAME='packerweb-server'
    }
		steps {
		sh "chmod +x provision.sh && chmod +x packer.json"
                sh "docker build --tag packerweb-server:latest ."
                sh "docker tag packerweb-server fatimahalobaidan/packerweb-server:latest"
            }
        }
        stage ('test') {
            steps {
                sh "docker run --rm packerweb-server"
            }
        }
stage ('release') {
            
            steps {
               
                sh "docker login -u ${CREDS_USR} -p ${CREDS_PSW}"
            }
    }
   }
}
