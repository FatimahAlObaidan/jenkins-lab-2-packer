pipeline {

    agent {
        docker {
            image 'bryandollery/terraform-packer-aws-alpine'
	    args "-u root"
        }
    }
    stages ('build') {
		steps {
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
                sh "whoami"
                sh "docker login -u ${CREDS_USR} -p ${CREDS_PSW}"
            }
    }
	environment{
             CREDS = credentials('creds-fatima')
	    OWNER='fatima'
	    TF_NAMESPACE='fatima'
	    PROJECT_NAME='packerweb-server'
    }
   }
}
