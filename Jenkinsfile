pipeline {
	environment {
		imagename = "zeroexistence/jenkins-docker-playground"
		registryCredential = 'docker-hub'
	}
    agent {
        node {
            label 'ubuntu-203'
        }
    }
    stages {
        stage('Build Image') {
            steps {
                sh 'docker build -t ${imagename} .'
            }
        }
        stage('Deploy Image') {
			steps {
				sh 'docker push ${imagename}'
			}
		}
    }
    post {
        success {
            echo 'success'
        }
        failure {
            echo 'failed'
        }
    }
}
