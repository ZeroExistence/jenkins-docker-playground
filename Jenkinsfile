pipeline {
	environment {
		imagename = "docker-playground"
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
                sh 'docker build -t jenkins-docker-playground .'
            }
        }
        stage('Deploy Image') {
            steps {
                sh 'docker build -t jenkins-docker-playground jenkins-docker-playground'
            }
        }
        stage('Deploy Image') {
			steps {
				sh 'docker push jenkins-docker-playground'
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
