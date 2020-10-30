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
        stage('Cloning git') {
            steps {
                git([url: 'https://github.com/ZeroExistence/jenkins-docker-playground.git', branch: 'master', credentialsId: 'github'])
            }
        }
        stage('Build Image') {
            steps {
                script {
					dockerImage = docker.build imagename
				}
            }
        }
        stage('Deploy Image') {
			steps {
				scripts {
					docker.withRegistry('', registryCredential) {
						dockerImage.push("$BUILD_NUMBER")
						dockerImage.push("latest")
				}
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
